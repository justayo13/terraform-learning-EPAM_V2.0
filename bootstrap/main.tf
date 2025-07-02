
# This configuration is used to create the GCS bucket that will store the
# Terraform state for all environments. It should be run once.

# The GCS bucket resource
resource "google_storage_bucket" "backend" {
  project      = var.project_id
  name         = var.bucket_name
  location     = var.location
  storage_class = "STANDARD"
  
  # Enable versioning to keep a history of your state files
  versioning {
    enabled = true
  }

  # Prevent accidental deletion of the bucket
  lifecycle {
    prevent_destroy = false # Set to true in a real production environment
  }
}

