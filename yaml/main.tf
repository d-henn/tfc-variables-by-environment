resource "random_pet" "this" {
  keepers = {
    ts = timestamp()
  }
  
  prefix = local.variables.pet_prefix
}
