output "ec2_global_ip" {
  value = "this is the public ip: ${aws_instance.ec2.public_ip}"
}
