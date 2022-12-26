resource "aws_key_pair" "instances" {
  key_name = var.key_name
  public_key = tls_private_key.instances.public_key_openssh
}

resource "tls_private_key" "instances" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}
