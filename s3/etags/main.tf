terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "deebucketv1"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.mybucket.bucket
  key    = "myfile.txt"
  source = "myfile.txt"

  etag = filemd5("myfile.txt")
}

