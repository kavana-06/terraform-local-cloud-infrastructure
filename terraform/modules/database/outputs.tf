output "container_name" {
  description = "Name of the PostgreSQL container"
  value       = docker_container.postgres.name
}

output "container_id" {
  description = "ID of the PostgreSQL container"
  value       = docker_container.postgres.id
}

output "database_name" {
  description = "Name of the PostgreSQL database"
  value       = var.database_name
}
