# Backend configuration snippet (to be included in your actual root module)
terraform {
  backend "s3" {
    bucket         = "my-cicd-project-backend-ap-south-1"
    key            = "state/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
