# --- Root Output ---
output "load_balancer_ip" {
  description = "The public IP address of the load balancer."
  value       = module.loadbalancer.lb_ip_address
}