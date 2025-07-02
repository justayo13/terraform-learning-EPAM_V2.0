# Variables for the Load Balancer module

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "env" {
  description = "The environment name (e.g., dev, uat, prod)."
  type        = string
}

variable "instance_group" {
  description = "The instance group to attach to the backend service."
  type        = string
}
