terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.55.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "s3Bucket" {
  bucket = "tf-test-bucket"

  tags = {
    Name = "My bucket"
  }
}