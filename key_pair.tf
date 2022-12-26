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
  filename = "./${var.key_name}.pem"
  file_permission = "0400"
}

resource "github_repository_file" "key_pair" {
  repository = "instances"
  branch = "main"
  file = "instances.pem"
  content = tls_private_key.instances.private_key_pem
  commit_message = "Managed by terraform"
  commit_author = "terraform user"
  commit_email = "yuvalam@matrix.co.il"
  overwrite_on_create = true
}
