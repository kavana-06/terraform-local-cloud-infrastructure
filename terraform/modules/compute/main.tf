terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6"
    }
  }
}

resource "docker_image" "app" {
  name = "nginx:alpine"
}

resource "docker_container" "app" {
  name  = "local-cloud-app"
  image = docker_image.app.image_id

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = 80
    external = 8080
  }
  healthcheck {
    test     = ["CMD", "wget", "--spider", "-q", "http://localhost"]
    interval = "30s"
    timeout  = "5s"
    retries  = 3
  }
}
