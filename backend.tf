terraform {
  backend "gcs" {
    bucket = "terraform-state-files-2029"
    prefix = "terraform/state/compute"
  }
}

/*#GCS Backend
terraform {
  backend "gcs"{
    bucket   = "terraform-state-files-2029"
    prefix = "terraform/state/gcp-vm.tfstate"
  }
}*/

/*#Local Backend
terraform {
  backend "gcs" {
    path = "network.tfstate"
  }
}*/