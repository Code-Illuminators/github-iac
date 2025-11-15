variable "github_token" {
description = "Secret token for Github"
type        = string
sensitive   = true
}

variable "owner" {
description = "Name of Organization"
type        = string
}

variable "name" {
description = "Name of Repository"
type = string
}