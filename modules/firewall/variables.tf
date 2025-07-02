# Variables for the Firewall module

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "env" {
  description = "The environment name (e.g., dev, uat, prod)."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network."
  type        = string
}

variable "ssh_source_ranges" {
  description = "A list of CIDR blocks to allow SSH from."
  type        = list(string)
  default     = ["0.0.0.0/0"] # WARNING: Open to the world. Change this!
}