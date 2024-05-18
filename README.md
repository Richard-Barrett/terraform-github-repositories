<img align="right" width="60" height="60" src="images/terraform.png">

# terraform-github-repositories
Terraform Module to Manage GitHub Repositories

This Terraform module is designed to manage GitHub repositories. It provides a way to create and configure repositories in a declarative manner, using Infrastructure as Code (IaC) principles.

Key features of this module include:

1. **Repository Creation**: The module allows you to create a new GitHub repository by specifying the repository name.

2. **Repository Configuration**: You can configure various aspects of the repository, such as whether it's private or public, whether it has issues, projects, wiki, and downloads enabled, and whether it should be auto-initialized with a README.

3. **Advanced Settings**: The module supports advanced repository settings like setting a gitignore template, a license template, merge settings, and repository topics.

4. **Security Settings**: You can enable or disable vulnerability alerts for the repository.

To use this module, you need to provide the repository name as an input. All other inputs have default values, but you can override them if needed. After setting up the module, you can apply it with Terraform to create and configure your GitHub repository.

Remember that to use this module, you need to authenticate with GitHub. You can do this by providing a GitHub token with the necessary permissions.

Example CICD with `BitBucket` and `Codefresh`:

![Image](./images/diagram.png)

## Notes

Here are some notes about this Terraform module for managing GitHub repositories:

1. **Purpose**: This module is designed to create and manage GitHub repositories. It allows you to specify various settings for a repository in a declarative manner.

2. **Inputs**: The only required input is the repository name. All other inputs, such as `description`, `private`, `has_issues`, `has_projects`, `has_wiki`, `has_downloads`, `auto_init`, `gitignore_template`, `license_template`, `allow_merge_commit`, `allow_squash_merge`, `allow_rebase_merge`, `delete_branch_on_merge`, `archived`, `topics`, and `vulnerability_alerts`, have default values but can be overridden.

3. **Outputs**: The module does not currently define any outputs. If needed, outputs can be added to return information about the created resources.

4. **Authentication**: The module requires a GitHub token with appropriate permissions. This should be provided through the `GITHUB_TOKEN` environment variable or the `token` argument in the GitHub provider configuration.

5. **Usage**: To use the module, call it in your Terraform configuration, provide the required inputs, and run `terraform init` and `terraform apply`.

6. **Versioning and State Management**: If you're using a remote module, consider using versioning to ensure consistent behavior. Also, consider using remote state storage and state locking if you're working in a team.

7. **Error Handling and Security**: Be aware of potential errors, such as conflicts in repository names. Also, avoid hardcoding sensitive data like tokens in your configuration files.

8. **Customization**: The module can be customized to suit your needs. For example, you can add more inputs or outputs, or modify the resource configuration.

## Usage

The following includes some examples on how you can use this module.

### Minimal Usage

Minimal usage using the default values:

```hcl
module "github_repository_test" {
  source = "../.."  # path to the module
  name   = "test"
}
```

The only input that does not have a default value is `name`, this allows you to specify a public repository name and use the module downstream

### Basic Usage

```hcl
module "github_repository_test" {
  source = "../.."  # path to the module
  name   = "test"
}
```

In this example, we're using the module located at ./modules/github_repository. We're creating a new GitHub repository named my-repo. The repository will have the description "This is my repository" and it will be private.

Remember to replace "./modules/github_repository" with the actual path to the module if it's located elsewhere.

After setting up the module, you can initialize your Terraform configuration with terraform init and then apply it with terraform apply.

### Advanced Usage with All Inputs Plus Options

```hcl
module "github_repository" {
  source = "./modules/github_repository"  # path to the module

  name                   = "my-repo"
  description            = "My awesome repo"
  homepage_url           = "https://my-awesome-repo.info"
  private                = false
  has_issues             = true
  has_projects           = true
  has_wiki               = true
  has_downloads          = true
  auto_init              = false
  gitignore_template     = ""
  license_template       = ""
  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = false
  archived               = false
  topics                 = ["topic1", "topic2"]
  vulnerability_alerts   = false
}
```

Sure, here's an advanced usage example of the Terraform module where we override more default values:

```hcl
module "github_repository" {
  source = "./modules/github_repository"  # path to the module
  name   = "my-advanced-repo"
  description = "This is my advanced repository"
  homepage_url = "https://my-advanced-repo.info"
  private = true
  has_issues = false
  has_projects = false
  has_wiki = false
  has_downloads = false
  auto_init = true
  gitignore_template = "Python"
  license_template = "mit"
  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false
  delete_branch_on_merge = true
  archived = false
  topics = ["terraform", "github", "advanced"]
  vulnerability_alerts = true
}
```

In this example, we're creating a new GitHub repository named `my-advanced-repo`. The repository will have the description "This is my advanced repository", it will be private, and it will have a homepage URL. We're also disabling issues, projects, wiki, and downloads, but enabling auto-initialization and vulnerability alerts. We're setting the gitignore template to "Python" and the license template to "MIT". We're disabling merge commits and rebase merges, but enabling squash merges and deletion of branches on merge. Finally, we're setting the topics of the repository.

Remember to replace `"./modules/github_repository"` with the actual path to the module if it's located elsewhere.

After setting up the module, you can initialize your Terraform configuration with `terraform init` and then apply it with `terraform apply`.

### Considerations

Here are some considerations when using this Terraform module:

1. `GitHub Authentication`: This module requires a GitHub token with appropriate permissions to create and manage repositories. Make sure to provide it either through the GITHUB_TOKEN environment variable or the token argument in the GitHub provider configuration.
2. `Module Versioning`: If you're using a remote module, consider using versioning to ensure consistent behavior. You can specify a particular version of a module by appending a version query parameter to the source URL.
3. `Sensitive Data`: Be careful with sensitive data like tokens. Avoid hardcoding them in your configuration files. Use environment variables or input variables instead.
4. `Error Handling`: Terraform will stop and roll back at the first error during apply. Make sure to handle potential errors in your configuration, such as invalid input values or lack of permissions.
5. `State Management`: Terraform keeps track of your infrastructure's state. If you're working in a team, consider using remote state storage and state locking to prevent conflicts.
6. `Module Inputs and Outputs`: Make sure to understand the inputs and outputs of the module. Inputs are the values you provide to the module, and outputs are the values the module returns. You can use outputs to pass information between modules or to get information about the resources created by the module.
7. `Resource Naming`: Be aware that the name input must be unique across your GitHub account. If you try to create a repository with a name that already exists, Terraform will return an error.
8. `Repository Settings`: Consider the settings of the repository you're creating. For example, if you set auto_init to true, GitHub will automatically create an initial commit with a README file in your repository. If you want to push an existing repository to GitHub, you should set auto_init to false.

## Overview

1. **Repository Creation**: The module allows you to create a new GitHub repository by specifying the repository name.

2. **Repository Configuration**: You can configure various aspects of the repository, such as whether it's private or public, whether it has issues, projects, wiki, and downloads enabled, and whether it should be auto-initialized with a README.

3. **Advanced Settings**: The module supports advanced repository settings like setting a gitignore template, a license template, merge settings, and repository topics.

4. **Security Settings**: You can enable or disable vulnerability alerts for the repository.

To use this module, you need to provide the repository name as an input. All other inputs have default values, but you can override them if needed. After setting up the module, you can apply it with Terraform to create and configure your GitHub repository.

Remember that to use this module, you need to authenticate with GitHub. You can do this by providing a GitHub token with the necessary permissions.

### Inputs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.6 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 6.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository.repository](https://registry.terraform.io/providers/integrations/github/6.2.1/docs/resources/repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | Whether the repository should allow merge commits | `bool` | `true` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | Whether the repository should allow rebase merges | `bool` | `true` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | Whether the repository should allow squash merges | `bool` | `true` | no |
| <a name="input_allow_update_branch"></a> [allow\_update\_branch](#input\_allow\_update\_branch) | value to allow update branch | `bool` | `true` | no |
| <a name="input_archived"></a> [archived](#input\_archived) | Whether the repository should be archived | `bool` | `false` | no |
| <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init) | Whether the repository should be automatically initialized | `bool` | `false` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Whether the repository should delete branches on merge | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | A description of the repository | `string` | `""` | no |
| <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template) | A gitignore template for the repository | `string` | `""` | no |
| <a name="input_has_downloads"></a> [has\_downloads](#input\_has\_downloads) | Whether the repository should have downloads enabled | `bool` | `true` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | Whether the repository should have issues enabled | `bool` | `true` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | Whether the repository should have projects enabled | `bool` | `true` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | Whether the repository should have a wiki enabled | `bool` | `true` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | A URL with more information about the repository | `string` | `""` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | Whether the repository should be a template repository | `bool` | `false` | no |
| <a name="input_license_template"></a> [license\_template](#input\_license\_template) | A license template for the repository | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_private"></a> [private](#input\_private) | Whether the repository should be private | `bool` | `false` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | A list of topics for the repository | `list(string)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | n/a | `string` | `"public"` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | Whether the repository should have vulnerability alerts enabled | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
