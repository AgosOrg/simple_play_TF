provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "acneto.co.hello"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
