variable "instance_name" {
  default = "weather_app"
}

variable "ubuntu_image" {
  default = "ami-0574da719dca65348"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "instances"
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

# github variables

variable "repo_name" {
  default = "instances"
}

variable "branch_name" {
  default = "main"
}

variable "file_name" {
  default = "instances.pem"
}

variable "commit_message" {
  default = "Managed by terraform"
}

varialbe "commit_author" {
  default = "terraform user"
}

variable "commit_email" {
  default = "yuvalam@matrix.co.il"
}

# key_pair variables

variable "algorithm" {
  default = "RSA"
}

variable "rsa_bits" {
  default = 4096
}

# provider variables

variable "aws_region" {
  default = "us-east-1"
}

variable "owner" {
  default = "yuvmix"
}

