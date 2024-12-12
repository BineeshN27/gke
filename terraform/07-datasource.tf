data "google_compute_zones" "central1_zones" {
  region = var.region
  status = "UP"
}

output "central1_zones" {
  value = data.google_compute_zones.central1_zones.names
}