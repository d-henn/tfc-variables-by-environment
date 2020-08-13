resource "random_pet" "this" {
  keepers = {
    ts = timestamp()
  }
  
  prefix = local.pet_prefix[var.tf_workspace]
}
