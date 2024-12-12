resource "aws_key_pair" "key-pair" {
  key_name   = "ec2-key"
  public_key = file(var.ec2-public-key-path)
}

resource "aws_instance" "ec2-instance" {
  subnet_id                   = var.vpc-subnet-id
  associate_public_ip_address = var.enable-public-ip-address
  security_groups             = [var.security_groups_allowed_rules_id]

  ami           = var.ec2-ami-id
  instance_type = var.ec2-instance-type
  key_name      = aws_key_pair.key-pair.id

  tags = local.resource_tags

}
