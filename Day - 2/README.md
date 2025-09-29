# Day 2 - Terraform AWS Apache Web Server Setup

This folder contains Terraform configuration files to provision an Apache web server on AWS EC2.

## What Was Done

- **Provider Configuration**: Set up the AWS provider in [`provider.tf`](provider.tf).
- **Variables**: Defined variables for AWS region and EC2 instance type in [`variables.tf`](variables.tf) and provided values in [`terraform.tfvars`](terraform.tfvars).
- **Security Group**: Created a security group in [`sg.tf`](sg.tf) to allow SSH (port 22) and HTTP (port 80) access from a specific IP.
- **EC2 Instance**: Provisioned an EC2 instance in [`ec2.tf`](ec2.tf) using a specified AMI and the security group. The instance uses the SSH key found in [`ssh-keys/ssh-key-pair-common.pem`](ssh-keys/ssh-key-pair-common.pem).
- **Provisioning**: Used Terraform provisioners to copy [`web.sh`](web.sh) to the EC2 instance and execute it. This script installs Apache, downloads a website template, and sets up the web server.
- **Outputs**: Defined outputs in [`outputs.tf`](outputs.tf) to show the EC2 public IP and security group ID after deployment.

## Usage

1. Update variable values in [`terraform.tfvars`](terraform.tfvars) as needed.
2. Run `terraform init` to initialize the working directory.
3. Run `terraform apply` to provision resources.
4. After apply, access the Apache web server using the public IP output.

## Files

- [`provider.tf`](provider.tf): AWS provider setup.
- [`variables.tf`](variables.tf): Input variables.
- [`terraform.tfvars`](terraform.tfvars): Variable values.
- [`sg.tf`](sg.tf): Security group configuration.
- [`ec2.tf`](ec2.tf): EC2 instance resource and provisioning.
- [`web.sh`](web.sh): Script to install and configure Apache.
- [`outputs.tf`](outputs.tf): Output values.
- [`ssh-keys/ssh-key-pair-common.pem`](ssh-keys/ssh-key-pair-common.pem): SSH private key for EC2 access.

---

**Note:** The security group allows SSH and HTTP only from the specified IP. Update as needed for your environment.
