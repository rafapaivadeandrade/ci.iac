terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
  }
  backend "s3" {
    bucket = "rocketseat-iac-staging-9f47d8ca"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}
provider "aws" {
  region = "us-east-2"
    # profile = "AdministratorAccess-416098782400"
}
resource "aws_s3_bucket" "terraform-state" {
  bucket        = "rocketseat-iac-staging-9f47d8ca"
  force_destroy = true
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    IAC = "True"
  }
}
resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = "rocketseat-iac-staging-9f47d8ca"
  versioning_configuration {
    status = "Enabled"
  }
}