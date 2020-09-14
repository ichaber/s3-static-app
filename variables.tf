variable "region" {
  type = string
  default = "ap-southeast-2"
}

variable "domainname" {
  description = "The name of the domain to use"
  type = string
}

variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name"
  type = string
}
