terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6"
    }
  }

  required_version = ">= 1.5.0"
}

provider "docker" {}

resource "docker_network" "local_cloud_network" {
  name   = "local-cloud-network"
  driver = "bridge"
}

module "compute" {
  source = "../../modules/compute"

  network_name = docker_network.local_cloud_network.name
}
