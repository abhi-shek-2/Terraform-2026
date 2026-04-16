# resource "aws_vpc" "vpc_main" {
#   cidr_block = var.cidr_range
#   region     = var.region

#   tags = {
#     Name        = var.my_vpc
#     Environment = var.environment
#   }
# }


# resource "aws_s3_bucket" "Bucket_example" {
#   bucket = var.bucket_name

#   tags = {
#     Name   = "my-first-bucket"
#     # vpc_id = aws_vpc.vpc_main.id
#   }
# }

resource "aws_instance" "server1" {
  ami = data.aws_ami.ubuntu.id
  # count         = 2
  instance_type = var.instance_type
  tags          = var.common_tags
}

resource "aws_s3_bucket" "bucket_creation" {
  for_each = var.bucket_list
  bucket   = each.value
  depends_on = [ aws_instance.server1 ]
  tags = var.common_tags
}
