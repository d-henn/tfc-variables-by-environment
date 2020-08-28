
## Config

Leverage the built in use of [`<name>.tfvars`](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files) files.

- [workspaces/**test**.env.tfvars](./workspaces/test.env.tfvars)
- [workspaces/**prod**.env.tfvars](./workspaces/prod.env.tfvars)

## Workspace variable

![cli-tfvars](./docs/cli-tfvars.png)

## Pros & Cons

| Pros | Cons |
| ---- | ---- |
| Use variables as intended with the `.tfvars` file. | HashiCorp can always change the way this environment variable works. |
| Empowers flat file structure; no folder nesting. | |
| Less likely to fat finger and mess up variables per environment. | |
| Can version control variables and review changes through Pull Requests. | |
| Keeps variable validation. | |
| Keeps variable type checking. | |
