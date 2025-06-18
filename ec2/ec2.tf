resource "aws_instance" "roboshop" {
  #ami           = "ami-09c813fb71547fc4f"
  ami           = "data.aws_ami.joindevops.id" #Here We taken from data source folder, data.tf file
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allowing_all.id ] 

  tags = {
    Name = "roboshop"
  }
}

resource "aws_security_group" "allowing_all" {
    name        = "allow_all"
    description = "allow all traffic"

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allowing-all"
    }
}