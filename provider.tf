provider "aws" {
  region = var.aws_region
}

provider "github" {
  owner = var.owner
}
