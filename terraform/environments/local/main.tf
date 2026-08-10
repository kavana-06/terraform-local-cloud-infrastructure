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

module "security" {
  source = "../../modules/security"

  network_name = "local-cloud-secure-network"
}
module "database" {
  source = "../../modules/database"

  container_name    = "local-postgres"
  database_name     = "localcloud"
  database_user     = "admin"
  database_password = "localcloud123"
  network_name      = docker_network.local_cloud_network.name
}
