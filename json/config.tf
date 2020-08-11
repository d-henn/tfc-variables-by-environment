locals {
  workspace_variables = jsondecode(file("${path.root}/workspaces/${var.tf_workspace}_variables.json"))
}
