# main.tf
resource "aws_s3_bucket" "my_bucket" {
  bucket  = "my-unique-bucket-name"
  tags    = {
  Name           = "MyS3Bucket"
  Environment    = "Production"
  }
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
