terraform {
  required_version = "~> 0.12"
  
  backend "remote" {
    hostname = "app.terraform.io"   # use your host if self hosted
    organization = "company"        # use your organization

    workspaces {
      prefix = "my-app-"            # use your workspace prefix
    }
  }
}
