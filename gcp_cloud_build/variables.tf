variable "branch_name" {
  type             = string
  description      = "Branch name of the Cloud Source Repository"
}

variable "repo_name" {
  type             = string
  description      = "Cloud Source Repository Name"
}

variable "filename" {
  type             = string
  description      = "Path from the source root to a file whose contents is used for the template"
}

# variable "service_account" {
#   type           = string
#   description    = "Service Account used for all user-controlled operations"
# }

variable "build" {
  type             = object({
    name           = string
    script         = string
    timeout        = string
    secret_env     = list(string)
    ttl            = string
    logs_bucket    = string
    # kms_key_name = string
    env            = string
    version_name   = string
  })
 description       = "Contents of the build template"
}

variable "filename_is_trigger" {
  type             =  bool
  description      = "If set to true then block is triggered using filename else block is triggered using build template"
}

# variable "members"{
#     type         = list
#     description  = "Identities that will be granted the privilege in role"
# }
