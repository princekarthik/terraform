output "trigger_id" {
  value       = module.cloudbuild.trigger_id
  description = "The unique identifier for the trigger"
}

output "trigger_id_build" {
  value       = module.cloudbuild.trigger_id_build
  description = "an identifier for the resource with format"
}

