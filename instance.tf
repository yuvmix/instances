resource "aws_instance" "ec2" {
  ami             = var.ubuntu_image 
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = var.security_group
  
  tags = {
    Name = var.instance_name
  }

    connection {
      type        = "ssh"
      user        = var.instance_user
      host        = self.public_ip
      private_key = tls_private_key.instances.private_key_pem 
    }
    
  
  provisioner "file" {
    source = var.file
    destination = var.file
  }
  
  provisioner "remote-exec" {
    inline = var.inline
  }
}
