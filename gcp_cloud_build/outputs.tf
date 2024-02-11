output "trigger_id" {
  value       = google_cloudbuild_trigger.filename-trigger[*].trigger_id
  description = "The unique identifier for the trigger"
}

output "trigger_id_build" {
  value       = google_cloudbuild_trigger.build-trigger[*].id
  description = "an identifier for the resource with format"
}

