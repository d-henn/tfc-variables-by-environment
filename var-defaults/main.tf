resource "random_pet" "this" {
  keepers = {
    ts = timestamp()
  }
  
  prefix = var.pet_prefix[var.tf_workspace]
}
