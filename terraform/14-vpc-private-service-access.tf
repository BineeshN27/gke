resource "google_project_service" "private-service-access" {
  project = var.project
  service = "servicenetworking.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }
  disable_on_destroy = false
  depends_on         = [google_compute_network.vpc_network]
}


resource "google_compute_global_address" "private_ip_address_range" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc_network.id
}


resource "google_service_networking_connection" "private_service_connection" {
  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address_range.name]
}