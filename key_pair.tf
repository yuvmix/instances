resource "aws_key_pair" "instances" {
  key_name = var.key_name
  public_key = tls_private_key.instances.public_key_openssh
}

resource "tls_private_key" "instances" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "instances" {
  content = tls_private_key.instances.private_key_pem
  filename = "./${var.key_name}"
}
