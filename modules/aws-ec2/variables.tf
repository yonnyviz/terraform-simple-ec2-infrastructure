# 
# VPC Configuration
#
variable "enable-public-ip-address" {
  description = "Enable public ip address, in order publicly to access the EC2 instace."
  type        = bool
  default     = false
}

variable "vpc-subnet-id" {
  description = "VPC subnet id that will be attached to the created EC2 instance"
  type        = string
}

variable "security_groups_allowed_rules_id" {
  description = "EC2 sercurity rules what will be applied during instance creation"
  type        = string
}

# 
# EC2 Configuration
#
variable "ec2-instance-type" {
  description = "EC2 instance type, e.g. t2.micro, t2.small, etc..."
  type        = string
  default     = "t2.micro"
}

variable "ec2-ami-id" {
  description = "EC2 machine image id that will be attached to the created EC2 instance"
  type        = string
}

variable "ec2-public-key-path" {
  description = "EC2 machine image id that will be attached to the created EC2 instance"
  type = string
}

variable "resource-type" {
  description = "The resource's technical function, e.g. webserver, database, shared-file-system, etc..."
  type        = string
}

variable "resource-automation-exclude" {
  description = "true/false value for automation to not modify the resource"
  type        = bool
  default     = false
}

variable "resource-pii" {
  description = "true/false value if the resource stores personal identifiable information"
  type        = bool
  default     = false
}

variable "environment" {
  description = "The environment the resource is deployed to"
  type        = string
}
