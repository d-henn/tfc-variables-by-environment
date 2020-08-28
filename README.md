Many people I know use the popular _Terraform_ provided variable `terraform.workspace` or powerful `-var-file=...` command line flag to switch variable values based on environment/workspace.

However, in Terraform Cloud (TFC) / Terraform Enterprise (TFE), the value of `terraform.workspace` will always evaluate to [`default`](https://www.terraform.io/docs/state/workspaces.html#workspace-internals) and you cannot provide a var file to the command line _(sort of)_. This is a problem for many as they migrate to these remote backends, as it messes up their current workflow. 

Even though some of the functionality has changed between open source and TFC/TFE, there are ways to mimick the capabilities you may be used to. Below will outline how one can go about configuring the backend and selecting the workspace of choice, while each example's `README.md` will go through how to supply variables based on the workspace that was chosen.

## Configuring backend

```tf
terraform {
  required_version = "~> 0.12"
  
  backend "remote" {
    hostname = "app.terraform.io"   # use your host if self hosted
    organization = "company"        # use your organization

    workspaces {
      prefix = "my-app-"            # <-- the magic, use your workspace prefix
    }
  }
}
```

## Selecting workspace

There are two main approaches to selecting a workspace in TFC/TFE. 

The first being in interactive mode. This is normally done when a user is present and needing to interact with the console, such as on your local machine.

```bash
$ terraform workspace select test
```

The second approach may be when _Terraform_ is ran in some automated fashion, such as your CI/CD pipeline.

```bash
$ export TF_WORKSPACE=test
```

## Examples

There are ultimately endless possibilities to solve the problem from above. But the examples listed below were some of the approaches I find worthy of mentioning and are ordered by my personal preference.

1. [cli-tfvars](./cli-tfvars)
2. config
    * [yaml](./yaml)
    * [json](./json)
3. [locals-v1](./locals-v1)
4. [locals-v2](./locals-v2)
5. [var-defaults](./var-defaults)
6. [tfc-gui](./tfc-gui)
7. [auto-tfvars](./auto-tfvars)
