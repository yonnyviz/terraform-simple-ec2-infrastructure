output "id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2-instance.id
}

output "private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.ec2-instance.private_ip
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2-instance.public_ip
}

output "public_dns" {
    value = "${aws_instance.ec2-instance.public_dns}"
}

output "cloudwatch_logs_url" {
    value = "https://${aws_instance.ec2-instance.public_dns}/cloudwatch-logs"
}