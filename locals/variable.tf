variable "project" {
    default = "robosop"
}

variable "environment" {
    default = "dev"
}

variable "component" {
    default = "cart"
}


variable "common_tags" {
    default = {
        project = "roboshop"
        terraform = "true"
    }
}