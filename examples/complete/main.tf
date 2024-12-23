terraform {
  required_version = ">= 1.5.6"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
}

provider "github" {}

module "github_repository_test" {
  source = "../.." # path to the module
  name   = "test"
}