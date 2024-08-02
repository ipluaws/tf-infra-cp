provider "aws" {
    region = "eu-central-1"
}

terraform {
  required_version = "1.4.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.56.0"
    }
  }
}

# Setup remote state for Infra
# ################ infra #############################
# Bucket for terraform state
resource "aws_s3_bucket" "terraform-state-infra" {
  bucket = "cpartner-terraform-state-infra"
  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  force_destroy = false
  acl = "private"

}

# DynamodDB table for terraform state locking
resource "aws_dynamodb_table" "terraform-locks-infra" {
  name         = "terraform-state-locks-infra"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

}
