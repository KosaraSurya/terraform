terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket = "devops84s-remote-state" #bucket we created in aws console/s3
    key    = "remote-state-demo"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
    #dynamodb_table = "84s-remote-state" #Any name we can give.There is no rule that it should be match with bucket name.
  }
}

#Here state will be saved in bucket and for locking use dynamoDB. By using key name state file will be stored.
#after giving terraform appy -auto-approve after its staart executing we can seee some entry in dynamoDB that meaans it is locking
#after successful completion of terraform apply command we can see lock file in s3 bucket

provider "aws" {
  # Configuration options here we have to mention asw credentiasl i.e, aws cli but it not recommended to provide creds here
}