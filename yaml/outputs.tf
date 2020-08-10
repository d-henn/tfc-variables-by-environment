output "workspace_variables" {
  value       = local.workspace_variables
  description = "Variables loaded in by the ${tf_workspace}_variables.yaml configuration"
}

output "pet_id" {
  value       = random_pet.this.id
  description = "Pet id returned from random_pet.this"
}
