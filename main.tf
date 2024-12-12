provider "aws" {
  region = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-xmghu0yx-4fc0e113-9a9a-4c1c-9a13-283a5d989984"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-lock-xmghu0yx-4fc0e113-9a9a-4c1c-9a13-283a5d989984"
    region         = "us-east-1"
    encrypt        = true
  }
}

module "ec2_instance" {
  source        = "../../modules/aws-ec2-module"
  resource-type = "aws_instance"

  vpc-subnet-id                    = var.subnet_id
  security_groups_allowed_rules_id = var.security_group_ids[0]
  enable-public-ip-address         = var.associate_public_ip
  ec2-ami-id                       = var.ami_id
  ec2-instance-type                = var.instance_type
  ec2-public-key-path              = var.ssh_public_key_path
  environment                      = var.environment
}
