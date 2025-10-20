terraform {
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "0.5.4"
    }
  }
}

provider "minikube" {
  kubernetes_version = "v1.30.0"
}

resource "minikube_cluster" "docker" {
  driver       = "docker"
  cluster_name = "terraform-minikube"
  nodes        = 2
  addons = [
    "default-storageclass",
    "storage-provisioner",
    "registry"
  ]
}
