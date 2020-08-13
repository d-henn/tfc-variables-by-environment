variable "tf_workspace" {
  type        = string
  description = "Selected workspace for Terraform run (e.g, dev, test, prod, etc...)"
}

variable "pet_prefix" {
  type        = string
  description = "Prefix for random pet generator"

  default = {
    test = "test-pet"
    prod = "prod-pet"
  }
}
