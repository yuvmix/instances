provider "aws" {
  region = var.aws_region
}

provider "github" {
  owner = "yuvmix"
  token = var.github_token
}
