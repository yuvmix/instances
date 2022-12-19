provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-019f0583716f0aec4" 
  instance_type = "t2.micro"
  key_name = "key.pem"
  security_group= ["ssh_security_group"]
  
  tags = {
    Name = "web_application"
  }
}
