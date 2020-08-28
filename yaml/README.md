
For example, in `workspaces` directory there are two configurations.

1. [**test**_variables.yaml](./workspaces/test_variables.yaml)
2. [**prod**_variables.yaml](./workspaces/prod_variables.yaml)

## Usage

```tf
locals {
  workspace_variables = yamldecode(file("${path.root}/workspaces/${var.tf_workspace}_variables.yaml"))
}
```

However, in Terraform Cloud / Terraform Enterprise, the value of `terraform.workspace` will always evaluate to [`default`](https://www.terraform.io/docs/state/workspaces.html#workspace-internals).


You can get around using `terraform.workspace` by supplying your own custom variable that will denote which workspace has been selected. In this example, that variable is defined as `variable "tf_workspace {...}`. To supply the variable, you can simply add it into your workspace variables in TFC/TFE like so.

![tf_workspace](./docs/tf_workspace.png)

## Selecting Workspace

### User Interaction

```bash
$ terraform workspace select test
```

### In Automation

```bash
$ export TF_WORKSPACE=test
```

Since `test` was selected as the workspace of choice, _Terraform_ will now interpolate `${var.tf_workspace}_variables.yaml` as `test_variables.yaml`.
