output "ec2_ips" {
  value = { for k, v in aws_instance.ec2 : k => v.public_ip }
}
