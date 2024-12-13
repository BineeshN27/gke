output "gke_cluster_name" {
  value = google_container_cluster.gke_learning.name
}

output "gke_cluster_location" {
  value = google_container_cluster.gke_learning.location
}

output "gke_cluster_endpoint" {
  value = google_container_cluster.gke_learning.endpoint
}

output "gke_master_version" {
  value = google_container_cluster.gke_learning.master_version
}

output "gke_node_pool" {
  value = google_container_node_pool.node_pool.id
}

output "gke_node_pool_version" {
  value = google_container_node_pool.node_pool.version
}
