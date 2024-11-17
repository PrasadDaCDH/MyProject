# Define the provider
provider "aws" {
  region = "ap-south-1" # Replace with your desired region
}

# Create an S3 bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-cicd-project-backend-ap-south-1" # Ensure this is globally unique
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "retain-versioned-state"
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }
  }
}

# Create a DynamoDB table for state locking and consistency
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
