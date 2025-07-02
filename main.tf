# This is the root configuration that calls the reusable modules.
# The variables for each environment are passed in via .tfvars files.

module "network" {
  source      = "./modules/network"
  project_id  = var.project_id
  env         = var.env
  region      = var.region
  subnet_cidr = var.subnet_cidr
}

module "firewall" {
  source            = "./modules/firewall"
  project_id        = var.project_id
  env               = var.env
  network_name      = module.network.network_name
  ssh_source_ranges = var.ssh_source_ranges
}

module "compute" {
  source            = "./modules/compute"
  project_id        = var.project_id
  env               = var.env
  region            = var.region
  machine_type      = var.machine_type
  instance_count    = var.instance_count
  network_self_link = module.network.network_self_link
  subnet_self_link  = module.network.subnet_self_link
}

module "loadbalancer" {
  source         = "./modules/loadbalancer"
  project_id     = var.project_id
  env            = var.env
  instance_group = module.compute.instance_group
}

# --- Root Output ---
output "load_balancer_ip" {
  description = "The public IP address of the load balancer."
  value       = module.loadbalancer.lb_ip_address
}