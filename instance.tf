resource "aws_instance" "ec2" {
  ami             = var.ubuntu_image 
  instance_type   = var.instance_type
  security_groups = var.security_group
  tags = {
    Name = var.instance_name
  }

    connection {
      type        = "ssh"
      user        = var.instance_user
      host        = self.public_ip
    }
    
  
  provisioner "file" {
    source = var.file
    destination = var.file
  }
  
  provisioner "remote-exec" {
    inline = var.inline
  }
}