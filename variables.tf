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

# Network Module
variable "subnet_cidr" {
  description = "The CIDR block for the environment's subnet."
  type        = string
}

variable "routing_mode" {
  description = "The routing mode for the VPC."
  type        = string
  default     = "GLOBAL"
}

variable "private_ip_google_access" {
  description = "When set to true, allows VMs in this subnet to access Google services without external IPs."
  type        = bool
  default     = true
}

# Firewall Module
variable "network_name" {
  description = "The name of the VPC network."
  type        = string
}

variable "ssh_source_ranges" {
  description = "A list of CIDR blocks to allow SSH from."
  type        = list(string)
}

# Compute Module
variable "machine_type" {
  description = "The machine type for the instances."
  type        = string
  default     = "e2-micro"
}

variable "instance_count" {
  description = "The number of instances to create."
  type        = number
  default     = 2
}

variable "network_self_link" {
  description = "The self_link of the VPC network."
  type        = string
}

variable "subnet_self_link" {
  description = "The self_link of the subnet."
  type        = string
}

variable "web_server_tag" {
  description = "The network tag to apply to web servers."
  type        = string
  default     = "web-server"
}

variable "source_image" {
  description = "The source image for the boot disk."
  type        = string
  default     = "debian-cloud/debian-11"
}

# Load Balancer
variable "instance_group" {
  description = "The instance group to attach to the backend service."
  type        = string
}

variable "armor_rules" {
  description = "A list of objects defining the Cloud Armor security policy rules."
  type        = any # Using 'any' as the structure is defined in the root module
}

variable "health_check_port" {
  description = "The port used for the health check."
  type        = number
}

variable "health_check_interval_sec" {
  description = "How often (in seconds) to send a health check."
  type        = number
}

variable "health_check_timeout_sec" {
  description = "How long (in seconds) to wait before claiming failure."
  type        = number
}

variable "health_check_healthy_threshold" {
  description = "A so-far unhealthy instance will be marked healthy after this many consecutive successes."
  type        = number
}

variable "health_check_unhealthy_threshold" {
  description = "A so-far healthy instance will be marked unhealthy after this many consecutive failures."
  type        = number
}

variable "backend_protocol" {
  description = "The protocol for the backend service."
  type        = string
}

variable "backend_port_name" {
  description = "The name of the port on the backend service."
  type        = string
}

variable "backend_timeout_sec" {
  description = "Timeout for the backend service."
  type        = number
}

variable "forwarding_rule_port_range" {
  description = "The port range for the global forwarding rule."
  type        = string
}
