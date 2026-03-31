# compute/main.tf
# 📥 Read outputs from Project A's local state
data "terraform_remote_state" "network" {
  backend = "gcs"
  config = {
    bucket = "terraform-state-files-2029"
    prefix = "terraform/state/network" # ← Must match 01-network/backend.tf prefix
  }

}

# Use the values from Project A
resource "google_compute_instance" "vm" {
  project      = "qwiklabs-gcp-01-b89a5ca713de"
  name         = "my-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    # ✅ Using VPC & Subnet from Project A's state
    network    = data.terraform_remote_state.network.outputs.vpc_id
    subnetwork = data.terraform_remote_state.network.outputs.subnet_id
    access_config {}
  }
}