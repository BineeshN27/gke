resource "google_container_cluster" "gke_learning" {
  name = "gke-learning"

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "0.0.0.0/0"
      display_name = "my-machine"
    }
  }

  network    = google_compute_network.vpc_network.self_link
  subnetwork = google_compute_subnetwork.subnet_uscentral1.self_link

  ip_allocation_policy {
    cluster_secondary_range_name  = google_compute_subnetwork.subnet_uscentral1.secondary_ip_range[0].range_name
    services_secondary_range_name = google_compute_subnetwork.subnet_uscentral1.secondary_ip_range[1].range_name
  }

  deletion_protection      = false
  initial_node_count       = 1
  remove_default_node_pool = true


}

resource "google_container_node_pool" "node_pool" {
  name           = "gke-learning-node-pool"
  cluster        = google_container_cluster.gke_learning.name
  node_count     = 1
  node_locations = data.google_compute_zones.central1_zones.names
  node_config {
    disk_size_gb    = 20
    disk_type       = "pd-standard"
    machine_type    = "e2-medium"
    preemptible     = true
    service_account = google_service_account.gke_sa.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]

  }
  autoscaling {
    location_policy = "BALANCED"
    min_node_count  = 1
    max_node_count  = 3
  }

}
