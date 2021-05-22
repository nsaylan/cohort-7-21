provider "aws" {
  region  = "us-east-1"
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.38.0"
    }
  }
}
resource "aws_instance" "tf-ec2" {
  ami           = var.ec2-ami
  instance_type = var.ec2-type
  key_name      = "First_key_pair" # update
  tags = {
    Name = "${var.ec2-name}-noble"
  }
}
resource "aws_s3_bucket" "tf-s3" {
  bucket = var.s3-bucket-name
  acl    = "private"
}
output "tf-example-public_ip" {
  value = aws_instance.tf-ec2.public_ip
}
output "tf-example-private-ip" {
  value = aws_instance.tf-ec2.private_ip
}
output "tf-example-s3" {
  value = aws_s3_bucket.tf-s3[*]
}