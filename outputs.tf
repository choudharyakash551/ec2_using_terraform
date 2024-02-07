output "public_ip_add" {
  description = "aws public ip address"
  value = aws_instance.ec2_instance
}