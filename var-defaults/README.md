## Config

Configure the variable in question with a default map, with the key as your expected workspace value.

```tf
variable "pet_prefix" {
  type        = string
  description = "Prefix for random pet generator"

  default = {
    test = "test-pet"
    prod = "prod-pet"
  }
}
```

## Workspace variable

Since you can no longer use `terraform.workspace` for meaningful input, you can supply your own custom variable that will denote which workspace has been chosen. In this example, that variable is defined as `variable "tf_workspace" {...}`. To supply the variable, you can simply add it into your workspace variables in Terraform Cloud/Terraform Enterprise like so.

1. Select workspace in question.
2. Navigate to `Variables`.
3. Add / Edit variables under `Terraform Variables` section.
    1. Make the key whatever you are using to distinguish the workspace on, e.g `tf_workspace`.
    2. Make the value the workspace, e.g, `test`.
    
![tf_workspace](./docs/tf_workspace.png)

## Usage

In order to select the proper default variable, you can use a generic map lookup using the built in syntax `map[key]`.

```tf
resource "random_pet" "this" {
  keepers = {
    ts = timestamp()
  }
  
  prefix = var.pet_prefix[var.tf_workspace] # use variable
}
```

## Pros & Cons

> These are not all inclusive.

| Pros | Cons |
| ---- | ---- |
| Fairly easy to understand/use. | Can override defaults which could break the map lookup. |
| Can version and review changes. | Easily fat finger and mess up variables and/or edit wrong environment variables. |
| Empowers single file structure; no folder nesting. | |
| Keeps variable validation. | |
| Keeps variable type checking. | |
