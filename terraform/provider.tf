terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.65.0"
    }
  }

  backend "s3" {
    bucket = "shahe-terraform-state-bucket"
    key = "state/terraform.tfstate"
    region = "us-east-1"
  }
  

}

provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}
