variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "my-ec2-instance"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.small"
}

variable "environment" {
  description = "Environment tag for the EC2 instance"
  type        = string
  default     = "development"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address"
  type        = bool
  default     = false
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}
