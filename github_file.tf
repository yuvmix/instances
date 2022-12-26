resource "github_repository_file" "key_pair" {
  repository = var.repo_name
  branch = var.branch_name
  file = var.file_name
  content = tls_private_key.instances.private_key_pem
  commit_message = var.commit_message
  commit_author = var.commit_author
  commit_email = var.commit_email
  overwrite_on_create = true
}
