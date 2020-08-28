This approach essentially has three parts:

1. [Config File](#config-files)
2. [Load Config File](#load-file)
3. [Select Proper Config](#select-proper-config)

## Config File 

Create `yaml` files to house the configuration for variables. 

- [**test**_variables.yaml](./workspaces/test_variables.yaml)
- [**prod**_variables.yaml](./workspaces/prod_variables.yaml))

## Load Config File

Leverage the built in Terraform [`yamldecode`](https://www.terraform.io/docs/configuration/functions/yamldecode.html) and [`file`](https://www.terraform.io/docs/configuration/functions/file.html) functions to load in the file.

```tf
yamldecode(file("${path.root}/workspaces/<some-var-file>.yaml"))
```

## Select Proper Config

Select proper variable file based on environment/workspace.

```tf
locals {
  workspace_variables = yamldecode(file("${path.root}/workspaces/${var.tf_workspace}_variables.yaml"))
}
```

## Providing workspace variable


Instead of using `terraform.workspace` for interpolation, you can by supplying your own custom variable that will denote which workspace has been selected. In this example, that variable is defined as `variable "tf_workspace {...}`. To supply the variable, you can simply add it into your workspace variables in TFC/TFE like so.

![tf_workspace](./docs/tf_workspace.png)

Since `test` was selected as the workspace of choice, _Terraform_ will now interpolate `${var.tf_workspace}_variables.yaml` as `test_variables.yaml`.

## Pros & Cons
> These are not all inclusive.

| Pros | Cons |
| ---- | ---- |
| a | b |
