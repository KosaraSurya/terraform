variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
  
}

variable "instance_type" {
    type = string
    default = "t3.micro"
  
}

variable "ec2-tags" {
    type = map(string)
    default = {
        Name = "roboshop"
        purpose = "creating roboshop instance"
    }
  
}

variable "from_port" {
    default = 0
  
}

variable "to_port" {
    default = 0
  
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    default = {
        Name = "allowing-all"
    }
  }

variable "environment" {
    default = "dev"
}

variable "instances" {
    default = ["mongodb","redis","mysql","rabbbitmq"]
}

variable "zone_id" {
    default = "Z0748101MT6SJ25GGSYP"
  
}

variable "domain_name"{
    default = "devsecopstrainee.site"
}

variable "common_tags" {
    default = {
        project = "roboshop"
        terraform = "true"
    }
}
