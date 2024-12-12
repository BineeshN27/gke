resource "google_project_service" "api" {
  for_each = toset(var.apis)
  project  = var.project
  service  = each.key

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_on_destroy = false

}

resource "google_project_service" "compute-api" {
  project = var.project
  service = "compute.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }
  disable_on_destroy = false
  depends_on         = [google_compute_network.vpc_network]
}