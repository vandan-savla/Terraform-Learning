# Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

# Output the public subnet ID
output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

# Output the private subnet ID
output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private.id
}

# Output the public EC2 instance's public IP
output "public_ec2_ip" {
  description = "The public IP of the public EC2 instance"
  value       = aws_instance.public_instance.public_ip
}

# Output the private EC2 instance's private IP
output "private_ec2_ip" {
  description = "The private IP of the private EC2 instance"
  value       = aws_instance.private_instance.private_ip
}