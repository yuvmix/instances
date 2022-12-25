variable "instance_name" {
  default = "weather_app"
}

variable "aws_region" {
  default = "eu-east-1"
}

variable "ubuntu_image" {
  default = "ami-057fb6ca30447d5c7"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "docker-machines"
}

variable "private_key" {
  default = "./docker-machines.pem"
}

variable "security_group" {
  default = ["weather_app"]
}

variable "file" {
  default = "terraform.sh"
}

variable "instance_user" {
  default = "ubuntu"
}

variable "run_script_command" {
  default = "bash terraform.sh"
}

variable "inline" {
  default = [
      "bash terraform.sh",
      "docker run -p 80:8000 -d lalalili123yu/exercise24_web:1"
    ]
}

