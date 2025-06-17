resource "aws_instance" "roboshop" {
  ami           = var.ami_id  #In variables we declared ami_id, so we given reference here
  instance_type = var.instance_type #Dont change right side name because it is the syntax in terraform, left side user defined.
  vpc_security_group_ids = [ aws_security_group.allowing_all.id ] 

  tags = var.ec2-tags
}

resource "aws_security_group" "allowing_all" {  #allowing all is tag nme
    name        = "allow_all" #SG name
    description = "allow all traffic"

#Here ingress, egress are the blocks
    dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = "-1"
      cidr_blocks      = var.cidr_blocks
      ipv6_cidr_blocks = ["::/0"]
    }
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