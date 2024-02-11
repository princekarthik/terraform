branch_name               = "demo-branch"
repo_name                 = "demo-repo"
filename                  = "cloudbuild.yaml"
# service_account         = " google_service_account.cloudbuildowner.email"  #This is a placeholder value, create a service account and use it here.

build={
    name           = "ubuntu"
    script         = "hello world"
    timeout        = "120s"
    secret_env     = ["MY_SECRET"]
    ttl            = "20s"
    logs_bucket    = "gs://bucket-name/logs"
    # kms_key_name = "projects/myProject/locations/global/keyRings/keyring-name/cryptoKeys/key-name" #This is a placeholder value, create a kms key and use it here.
    env            = "MY_SECRET"
    version_name   = "projects/project-id/secrets/secret-name/versions/latest"
    
}

filename_is_trigger = false

# members = [] #This is a placeholder value, add members of your project here.