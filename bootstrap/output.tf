# Output the name of the bucket to be used in the backend configurations
output "gcs_bucket_name" {
  description = "The name of the GCS bucket for the Terraform backend."
  value       = google_storage_bucket.backend.name
}