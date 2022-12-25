resource "aws_key_pair" "instances" {
  key_name = "instances"
  public_key = tls_private_key.instances.public_key_openssh
}

resource "tls_private_key" "instances" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "instances" {
  content = tls_private_key.instances.private_key_pem
  filename = "instances"
}

resource "aws_instance" "ec2" {
  ami             = var.ubuntu_image 
  instance_type   = var.instance_type
  key_name        = "instances" # var.key_name
  security_groups = var.security_group
  
  tags = {
    Name = var.instance_name
  }

    connection {
      type        = "ssh"
      user        = var.instance_user
      host        = self.public_ip
      private_key = tls_private_key.instances.private_key_pem # file(var.key_place)
    }
    
  
  provisioner "file" {
    source = var.file
    destination = var.file
  }
  
  provisioner "remote-exec" {
    inline = var.inline
  }
}
