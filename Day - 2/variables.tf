
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "host_type" {
  description = "The type of Dedicated Host"
  type        = string
  default     = "t2.micro"
}
