locals {
  variables = yamldecode(file("${path.root}/workspaces/${var.env}_variables.yaml"))
}
