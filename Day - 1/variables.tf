variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}

# Variable for the private subnet CIDR block
variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
}

# Variable for the EC2 instance type
variable "instance_type" {
  description = "The instance type for EC2 instances"
  type        = string
}
variable "key_pair" {
  description = "The name of the SSH key pair"
  type        = string
}