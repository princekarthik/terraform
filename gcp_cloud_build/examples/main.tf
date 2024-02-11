module "cloudbuild"{
    source              = "../"
    branch_name         = var.branch_name
    repo_name           = var.repo_name
    filename            = var.filename
    build               = var.build
    filename_is_trigger = var.filename_is_trigger
  # members             = var.members
}




