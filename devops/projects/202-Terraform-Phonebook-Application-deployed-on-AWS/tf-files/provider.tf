terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.44.0"
    }
    github = {
      source = "integrations/github"
      version = "4.10.1"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
provider "github" {
  token = "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"
}