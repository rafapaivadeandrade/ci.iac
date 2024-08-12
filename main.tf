terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
  }
}

provider "aws" {
  profile = "AdministratorAccess-416098782400"
  region = "us-east-2"
}