resource "aws_instance" "roboshop" {
  count = length(var.instances) #count baes loop use for list
  ami           = var.ami_id  #In variables we declared ami_id, so we given reference here
  instance_type = var.environment == "dev" ? "t3.micro" : "t2.micro"  #Dont change right side name because it is the syntax in terraform, left side user defined.
  vpc_security_group_ids = [ aws_security_group.allowing_all.id ]

  tags = {
    Name = var.instances[count.index] #count.index is special variable, based on index's we will get instances names 
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