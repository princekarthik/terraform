# Cloud Build

## Features:
1. The resources/services/activations/deletions that this module will create/trigger one or more Cloud Build resources
2. Add secret environment variables to your build and encrypt them using KMS Key
3. Control access to builds using IAM
4. Attach Service Accounts to the resource

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+.

## Usage

Basic usage of this module is as follows:

```
module "cloudbuild"{
    source="../"
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

}

```


## Resources

| Name | Type |
|------|------|
| [google_cloudbuild_trigger.filename-trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |
| [google_cloudbuild_trigger.build-trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| branch_name | Branch name of the Cloud Source Repository | `string` | n/a | yes |
| build | Contents of the build template | <pre>object({<br>    name=string<br>    script = string<br>    timeout = string<br>    secret_env = list(string)<br>    ttl = string<br>    logs_bucket = string<br>    # kms_key_name = string<br>    env          = string<br>    version_name = string<br>  })</pre> | n/a | yes |
| filename | Path from the source root to a file whose contents is used for the template | `string` | n/a | yes |
| filename_is_trigger | If set to true then block is triggered using filename else block is triggered using build template | `bool` | n/a | yes |
| repo_name | Cloud Source Repository Name | `string` | n/a | yes |
| members | Identities that will be granted the privilege in role | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| trigger_id | The unique identifier for the trigger |
| trigger_id_build | an identifier for the resource with format |


## Enable APIs

* Cloud Build API

## Security measures included

| Control-ID | Control | Control Details | Threat Mitigation |
|------|-------------|------|---------|
| GCB-1 | Limiting builds triggered from external services | Cloud Build enables you to define an organization policy to control which external services can invoke build triggers.| Unauthorized access |
| GCB-2 | Using secrets from Secret Manager |To include sensitive information in your builds, you can store the information in Secret Manager and then configure your build to<br> access the information from Secret Manager.|Data Protection |

## References

* https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger




