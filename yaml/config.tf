locals {
  variables = yamldecode(file("${path.root}/workspaces/${var.tf_workspace}_variables.yaml"))
}
