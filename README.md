# AWS EC2 Instance Terraform Module

This Terraform module provisions an AWS EC2 instance using reusable EC2 and backend modules.

## Requirements

- Terraform >= 1.0
- AWS Provider ~> 5.0
- AWS account with appropriate permissions
- SSH public key for EC2 instance access

## Configuration

Example terraform.tfvars:

```hcl
# Required Variables
ami_id              = "ami-0e2c8caa4b6378d8c" # AMI ID for the EC2 instance
subnet_id           = "subnet-d30df5b5" # Subnet ID where the instance will be launched
security_group_ids  = ["sg-7585f555"] # List of security group IDs
ssh_public_key_path = "~/folder/to/public-key.pub" # Path to the SSH public key file

# Optional Variables
aws_region         = "us-east-1"
instance_type      = "t2.small"
environment        = "development"
instance_name      = "my-ec2-instance"
associate_public_ip = true
```

## Backend Setup for State Management

Go into the backend module `cd modules/backend` and run the following command to create the backend components (bucket, dynamodb table, etc.):
```shell
# Initialize the backend module
terraform init

# apply the backend module
terraform apply
```

## Initialize Main Module

1. Get the backend resource names from the output. `cd modules/backend && terraform output`
2. In `main.tf`, locate the backend block and replace the placeholder values with the values from the output.
```hcl
backend "s3" {
    bucket         = "<backend_bucket_name>"
    key            = "terraform.tfstate"
    dynamodb_table = "<backend_table_name>"
    region         = "<your_region>"
    encrypt        = true
}
```

2. Reinitialize Terraform with the new backend:
```shell
terraform init
```

3. Now proceed with the regular deployment:
```shell
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Notes

- Uses EC2 module from `modules/aws-ec2-module`
- Uses backend module from `modules/aws-backend-module` for state management
- Automatically creates and associates an SSH key pair
- Creates S3 bucket and DynamoDB table for state management
- Replace placeholder values in tfvars with your actual values

## License

This module is released under the MIT License. 