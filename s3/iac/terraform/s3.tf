resource "aws_s3_bucket" "mybucket" {
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}