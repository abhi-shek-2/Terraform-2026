resource "aws_s3_bucket" "Bucket_example" {
  bucket = var.bucket_name

  tags = {
    name = "my-first-bucket"
  }
}