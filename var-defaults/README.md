## Usage

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
