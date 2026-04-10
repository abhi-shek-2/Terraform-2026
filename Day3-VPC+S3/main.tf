resource "aws_vpc" "vpc_main" {
  cidr_block = var.cidr_range
  region     = var.region

  tags = {
    Name        = var.my_vpc
    Environment = var.environment
  }
}


resource "aws_s3_bucket" "Bucket_example" {
  bucket = var.bucket_name

  tags = {
    name   = "my-first-bucket"
    vpc_id = aws_vpc.vpc_main.id
  }
}