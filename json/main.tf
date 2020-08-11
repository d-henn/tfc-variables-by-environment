resource "random_pet" "this" {
  keepers = {
    ts = timestamp()
  }
  
  prefix = local.workspace_variables.pet_prefix
}
