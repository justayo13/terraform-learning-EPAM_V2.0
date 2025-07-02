# These variables are the inputs for the root module.
# Their values will be provided by the .tfvars files for each environment.

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "env" {
  description = "The environment name (e.g., dev, uat, prod)."
  type        = string
}

variable "region" {
  description = "The primary GCP region for the resources."
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR block for the environment's subnet."
  type        = string
}

variable "ssh_source_ranges" {
  description = "A list of CIDR blocks to allow SSH from."
  type        = list(string)
}

variable "instance_count" {
  description = "The number of web server instances."
  type        = number
}

variable "machine_type" {
  description = "The machine type for the web server instances."
  type        = string
}