resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_network
  auto_create_subnetworks = false
  depends_on              = [google_project_service.api]
}

resource "google_compute_subnetwork" "subnet_uscentral1" {
  name                     = var.subnet-us-central1
  ip_cidr_range            = var.subnet_cidr_uscentral1
  region                   = var.region
  private_ip_google_access = true
  network                  = google_compute_network.vpc_network.id
  depends_on               = [google_project_service.api]
  #   secondary_ip_range {
  #     range_name    = var.pod-range-us-central1
  #     ip_cidr_range = var.cidr-pod-us-central1
  #   }
  #   secondary_ip_range = {
  #     range_name    = var.service-range-us-central1
  #     ip_cidr_range = var.cidr-service-us-central1
  #   }
  secondary_ip_range {
    range_name    = "podip"
    ip_cidr_range = var.cidr-pod-us-central1
  }

  secondary_ip_range {
    range_name    = "serviceip"
    ip_cidr_range = var.services_ipv4_cidr_block
  }

}

