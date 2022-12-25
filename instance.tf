data "aws_key_pair" "instance" {
  key_name = "instance"
}

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
      private_key = data.aws_key_pair.instance.public_key #file(var.key_place)
    }
    
  
  provisioner "file" {
    source = var.file
    destination = var.file
  }
  
  provisioner "remote-exec" {
    inline = var.inline
  }
}
