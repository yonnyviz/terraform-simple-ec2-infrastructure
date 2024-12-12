# AWS EC2 Instance Terraform Module

This Terraform module provisions an AWS EC2 instance using reusable EC2 and backend modules.

## Requirements

- Terraform >= 1.0
- AWS Provider ~> 5.0
- AWS CLI configured with appropriate credentials
- SSH public key for EC2 instance access

## Project Structure
```
.
├── modules/
│   ├── aws-ec2-module/     # EC2 instance configuration
│   └── backend/            # State management configuration
├── main.tf                 # Main infrastructure configuration
├── variables.tf            # Variable declarations
├── terraform.tfvars        # Variable values
└── backend.hcl             # Backend configuration
```

## Quick Start

1. **Configure Variables**

Create `terraform.tfvars`:
```hcl
# Required Variables
ami_id              = "ami-0e2c8caa4b6378d8c"
subnet_id           = "subnet-d30df5b5"
security_group_ids  = ["sg-7585f555"]
ssh_public_key_path = "~/folder/to/public-key.pub"

# Optional Variables with defaults
aws_region         = "us-east-1"
instance_type      = "t2.small"
environment        = "development"
instance_name      = "my-ec2-instance"
associate_public_ip = true
```

2. **Set Up Backend Infrastructure**

```bash
# Navigate to backend module
cd modules/backend

# Initialize and apply backend infrastructure
terraform init
terraform apply

# Save the output values
terraform output
```

3. **Configure Backend**

Create `backend.hcl` using the outputs from step 2:
```hcl
bucket         = "<backend_bucket_name>"
key            = "terraform.tfstate"
dynamodb_table = "<backend_table_name>"
region         = "<your_region>"
encrypt        = true
```

4. **Deploy EC2 Instance**

```bash
# Return to root directory
cd ../..

# Initialize with backend configuration
terraform init -backend-config=backend.hcl

# Review and apply changes
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Module Components

### Backend Module (`modules/backend`)
- Creates S3 bucket for state storage
- Enables versioning and encryption
- Creates DynamoDB table for state locking
- Generates unique names using random strings

### EC2 Module (`modules/aws-ec2-module`)
- Provisions EC2 instance
- Configures networking and security
- Manages SSH key pair
- Sets up tags and metadata

## Important Notes

- **State Management**: All state files are encrypted and versioned in S3
- **Locking**: DynamoDB prevents concurrent modifications
- **Security**: 
  - Use appropriate security groups
  - Keep your SSH keys secure
  - Consider using AWS KMS for additional encryption
- **Costs**: Resources created may incur AWS charges

## Troubleshooting

Common issues and solutions:

1. **Backend Configuration Errors**
   - Ensure backend.hcl contains correct values
   - Verify AWS credentials have necessary permissions

2. **SSH Access Issues**
   - Verify security group allows SSH (port 22)
   - Ensure correct path to SSH public key

## Contributing

1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## License

This module is released under the MIT License. See [LICENSE](LICENSE) for details. 