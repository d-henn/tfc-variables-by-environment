locals {
  context_config = {
    test = {
      pet_prefix = "test-pet"
    }

    prod = {
      pet_prefix = "prod-pet"
    }
  }

  workspace_variables = local.context_config[var.tf_workspace]
}
