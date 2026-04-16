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
variable "instance_type" {
  type        = string
  description = "value of the type of the instance"
}

variable "common_tags" {
  type        = map(string)
  description = "Common Tags used for each resources"
}

variable "bucket_list" {
  type        = set(string)
  description = "List of all Buckets"
}