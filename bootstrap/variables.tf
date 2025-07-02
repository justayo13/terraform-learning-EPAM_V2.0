# Variables for the bucket to be used in the backend configurations

variable "project_id" {
  description = "The GCP project ID to host the backend bucket."
  type        = string
}

variable "location" {
  description = "The location for the GCS bucket."
  type        = string
  default     = "US"
}

variable "bucket_name" {
  description = "The name for the GCS backend bucket. Must be globally unique."
  type        = string
}
