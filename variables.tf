variable "name" {
  description = "The name of the repository"
  type        = string
}

variable "description" {
  description = "A description of the repository"
  type        = string
  default     = ""
}

variable "homepage_url" {
  description = "A URL with more information about the repository"
  type        = string
  default     = ""
}

variable "private" {
  description = "Whether the repository should be private"
  type        = bool
  default     = false
}

variable "has_issues" {
  description = "Whether the repository should have issues enabled"
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "Whether the repository should have projects enabled"
  type        = bool
  default     = true
}

variable "has_wiki" {
  description = "Whether the repository should have a wiki enabled"
  type        = bool
  default     = true
}

variable "has_downloads" {
  description = "Whether the repository should have downloads enabled"
  type        = bool
  default     = true
}

variable "auto_init" {
  description = "Whether the repository should be automatically initialized"
  type        = bool
  default     = false
}

variable "gitignore_template" {
  description = "A gitignore template for the repository"
  type        = string
  default     = ""
}

variable "license_template" {
  description = "A license template for the repository"
  type        = string
  default     = ""
}

variable "allow_merge_commit" {
  description = "Whether the repository should allow merge commits"
  type        = bool
  default     = true
}

variable "allow_squash_merge" {
  description = "Whether the repository should allow squash merges"
  type        = bool
  default     = true
}

variable "allow_rebase_merge" {
  description = "Whether the repository should allow rebase merges"
  type        = bool
  default     = true
}

variable "allow_update_branch" {
  description = "value to allow update branch"
  type        = bool
  default     = true
}

variable "is_template" {
  description = "Whether the repository should be a template repository"
  type        = bool
  default     = false
}

variable "delete_branch_on_merge" {
  description = "Whether the repository should delete branches on merge"
  type        = bool
  default     = false
}

variable "archived" {
  description = "Whether the repository should be archived"
  type        = bool
  default     = false
}

variable "topics" {
  description = "A list of topics for the repository"
  type        = list(string)
  default     = []
}

variable "visibility" {
  type    = string
  default = "public"
}

variable "vulnerability_alerts" {
  description = "Whether the repository should have vulnerability alerts enabled"
  type        = bool
  default     = false
}