## Config file 

This approach uses `yaml` files to house the configuration for variables. 

- [workspaces/**test**_variables.yaml](./workspaces/test_variables.yaml)
- [workspaces/**prod**_variables.yaml](./workspaces/prod_variables.yaml)

## Load config

Leverage the built in Terraform [`yamldecode`](https://www.terraform.io/docs/configuration/functions/yamldecode.html) and [`file`](https://www.terraform.io/docs/configuration/functions/file.html) functions to load in the configuration files.

```tf
yamldecode(file("${path.root}/workspaces/<some-var-file>.yaml"))
```

## Interpolation

Since you can no longer use `terraform.workspace` for meaningful interpolation, you can supply your own custom variable that will denote which workspace has been chosen. In this example, that variable is defined as `variable "tf_workspace" {...}`. To supply the variable, you can simply add it into your workspace variables in Terraform Cloud/Terraform Enterprise like so.

![tf_workspace](./docs/tf_workspace.png)

## Interpolate workspace for config

Select proper variable file based on environment/workspace.

```tf
locals {
  workspace_variables = yamldecode(file("${path.root}/workspaces/${var.tf_workspace}_variables.yaml")) # evaluates to test_variables.yaml
}
```

## Usage

```tf
resource "random_pet" "this" {
  keepers = {
    ts = timestamp()
  }
  
  prefix = local.workspace_variables.pet_prefix # using the variable
}
```

## Pros & Cons

> These are not all inclusive.

| Pros | Cons |
| ---- | ---- |
| YAML file as configuration. Many people like this as it was built with configuration in mind. | Context switching as you are no longer using HashiCorp Configuration Language [(HCL)](https://www.terraform.io/docs/configuration/index.html). |
| | No variable validation or type checking. |
