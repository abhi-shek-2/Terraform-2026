resource "aws_s3_bucket" "Bucket_example" {
  bucket = "my-terraform-bucket-2026-04"

  tags = {
    name = "my-first-bucket"
  }
}