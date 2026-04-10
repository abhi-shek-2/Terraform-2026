variable "bucket_name" {
  type        = string
  description = "S3 bucket name "
}
variable "region" {
  type        = string
  description = "Name of the region"
}
variable "cidr_range" {
  type        = string
  description = "CIDR values for the VPC"
}
variable "my_vpc" {
  type        = string
  description = "VPC Infomation"
}
variable "environment" {
  type        = string
  description = "Environment of resources"
}