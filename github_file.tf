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
