# network/main.tf
resource "google_compute_network" "vpc" {
  project                 = "qwiklabs-gcp-01-b89a5ca713de"
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  project       = "qwiklabs-gcp-01-b89a5ca713de"
  name          = "my-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc.id
}