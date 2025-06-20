resource "aws_instance" "roboshop" {
  ami           = var.ami_id  #In variables we declared ami_id, so we given reference here
  instance_type = var.instance_type #Dont change right side name because it is the syntax in terraform, left side user defined.
  vpc_security_group_ids = [ aws_security_group.allowing_all.id ] 

  tags = var.ec2-tags

   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> inventory"
    on_failure = continue #if provisoner fail also terrafrom will continue the execution
  }

   provisioner "local-exec" {
    command = "echo 'instance is destroyed'"
    on_failure = continue #if provisoner fail also terrafrom will continue the execution
    when = destroy #this provisioner will apply when we give terraform destroy -auto-approve
  }

  connection { #to execute remote-exec we need to connect with remote server which need credentials
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
     ]
    
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [ 
      "sudo systemctl stop nginx"
     ]
    
  }

}

resource "aws_security_group" "allowing_all" {  #allowing all is tag nme
    name        = "allow_all" #SG name
    description = "allow all traffic"

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.sg_tags
}