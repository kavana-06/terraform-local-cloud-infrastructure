terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6"
    }
  }
}

resource "docker_network" "secure_network" {
  name     = var.network_name
  driver   = "bridge"
  internal = true
}
