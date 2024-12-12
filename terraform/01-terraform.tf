terraform {
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = "5.42.0"
    }
  }

  backend "gcs" {
    bucket = "gke-learning-00001"
    prefix = "/dev/private-gke-standard-cluster"
  }
}

provider "google" {
  project = var.project
  region  = var.region
  #export GOOGLE_APPLICATION_CREDENTIALS=<path to the file>
}
