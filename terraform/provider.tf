terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
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
  access_key = $(tf-var-aws-access)
  secret_key = $(tf-var-aws-secret)
}
