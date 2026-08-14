terraform {
  backend "s3" {
    bucket = "aws-infra-devops"
    key    = "dev/ec2-terraform.tfsatate"
    region = "us-east-1"
    encrypt        = true
    use_lockfile = true
    dynamodb_endpoint = "https://aws-terraform-s3.us-east-1.amazonaws.com"
  }
}