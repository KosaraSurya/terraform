terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }
}

provider "aws" {
  # Configuration options here we have to mention asw credentiasl i.e, aws cli but it not recommended to provide creds here
}