//Cloudbuild resource using filename
resource "google_cloudbuild_trigger" "filename-trigger" {
  count         = var.filename_is_trigger ? 1 : 0
  project       = principal-rhino-413816
  trigger_template {
    branch_name = var.branch_name
    repo_name   = var.repo_name
  }
#   service_account = var.service_account
  filename      = var.filename
}

//Cloudbuild resource using build 
resource "google_cloudbuild_trigger" "build-trigger" {
  count         = var.filename_is_trigger ? 0 : 1
  trigger_template {
    branch_name = var.branch_name
    repo_name   = var.repo_name
  }
#   service_account = var.service_account
  dynamic "build" {
    for_each         = [var.build]
    content {
      step {
        name         = build.value.name
        script       = build.value.script
        timeout      = build.value.timeout
        secret_env   = build.value.secret_env
      }
    
      queue_ttl      = build.value.ttl
      logs_bucket    = build.value.logs_bucket
    #   secret {
    #     kms_key_name = build.value.kms_key_name
    #   }
      available_secrets {
        secret_manager {
          env          = build.value.env
          version_name = build.value.version_name
        }
      }
      }
    
  }
}

# resource to create IAM member to access cloudbuild
#  resource "google_project_iam_member" "cloudbuild_iam" {
#    count   = length(var.members)
#    project = var.project
#    role    = "roles/cloudbuild.builds.editor"
#    member  = var.members[count.index]
#  }
