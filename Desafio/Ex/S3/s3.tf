resource "aws_s3_bucket" "b" {
  bucket = "lab-fiap-1dvp-334131"
  acl    = "private"

  tags = {
    Name        = "lab-fiap-1dvp-334131"
    Environment = "admin"
  }
}