terraform {
  backend "s3" {
    bucket = "lab-fiap-1dvp-334131"
    key    = "workspaces"
    region = "us-east-1"
  }
}