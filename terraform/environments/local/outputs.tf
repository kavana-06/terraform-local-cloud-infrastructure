output "network_name" {
  description = "Name of the local Docker network"
  value       = docker_network.local_cloud_network.name
}

output "application_container_name" {
  description = "Name of the application container"
  value       = module.compute.container_name
}

output "application_container_id" {
  description = "ID of the application container"
  value       = module.compute.container_id
}

output "application_url" {
  description = "URL where the application is available locally"
  value       = "http://localhost:8080"
}
