terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.1.0"
    }
  }

  backend "s3" {
    bucket = "achulakyan.devopsaca.site"
    key = "terraform-state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
