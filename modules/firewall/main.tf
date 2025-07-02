# Resource definitions for Firewall Rules

# Allow HTTP traffic from anywhere
resource "google_compute_firewall" "allow_http" {
  project  = var.project_id
  name     = "${var.env}-allow-http"
  network  = var.network_name
  priority = 1000

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}

# Allow HTTPS traffic from anywhere
resource "google_compute_firewall" "allow_https" {
  project  = var.project_id
  name     = "${var.env}-allow-https"
  network  = var.network_name
  priority = 1000

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]
}


# Allow SSH traffic from a restricted range
resource "google_compute_firewall" "allow_ssh" {
  project  = var.project_id
  name     = "${var.env}-allow-ssh"
  network  = var.network_name
  priority = 1000

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_source_ranges
}
