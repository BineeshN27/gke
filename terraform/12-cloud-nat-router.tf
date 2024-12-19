resource "google_compute_router" "nat_router" {
  name    = "gke-router"
  network = google_compute_network.vpc_network.name

}

resource "google_compute_router_nat" "nat" {
  name                               = "gke-nat"
  router                             = google_compute_router.nat_router.name
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_ip_allocate_option             = "AUTO_ONLY"
  log_config {
    enable = true
    filter = "ALL"
  }
}