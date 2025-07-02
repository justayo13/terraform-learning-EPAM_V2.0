# Resource definitions for Load Balancers, Backend Services, and Cloud Armor

# --- Cloud Armor Security Policy ---
resource "google_compute_security_policy" "armor_policy" {
  project     = var.project_id
  name        = "${var.env}-armor-policy"
  description = "Default DDoS protection and IP blacklist"

  # Default rule to allow all traffic.
  # You can add more specific rules here.
  rule {
    action   = "allow"
    priority = 2147483647
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "Default allow rule"
  }
}

# --- Load Balancer Components ---
# Health Check
resource "google_compute_health_check" "http_health_check" {
  project             = var.project_id
  name                = "${var.env}-http-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  
  http_check {
    port = 80
  }
}

# Backend Service
resource "google_compute_backend_service" "web_backend" {
  project             = var.project_id
  name                = "${var.env}-web-backend"
  protocol            = "HTTP"
  port_name           = "http"
  load_balancing_scheme = "EXTERNAL"
  timeout_sec         = 30
  health_checks       = [google_compute_health_check.http_health_check.id]
  security_policy     = google_compute_security_policy.armor_policy.self_link

  backend {
    group = var.instance_group
  }
}

# URL Map
resource "google_compute_url_map" "url_map" {
  project         = var.project_id
  name            = "${var.env}-url-map"
  default_service = google_compute_backend_service.web_backend.id
}

# Target HTTP Proxy
resource "google_compute_target_http_proxy" "http_proxy" {
  project = var.project_id
  name    = "${var.env}-http-proxy"
  url_map = google_compute_url_map.url_map.id
}

# Global Forwarding Rule (IP Address)
resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  project               = var.project_id
  name                  = "${var.env}-forwarding-rule"
  target                = google_compute_target_http_proxy.http_proxy.id
  port_range            = "80"
  load_balancing_scheme = "EXTERNAL"
}
