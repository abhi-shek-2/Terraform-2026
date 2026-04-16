terraform {
  backend "s3" {
    bucket       = "state-file-management-terraform-2026"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}