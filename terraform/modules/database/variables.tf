variable "container_name" {
  description = "Name of the PostgreSQL container"
  type        = string
}

variable "database_name" {
  description = "Name of the PostgreSQL database"
  type        = string
}

variable "database_user" {
  description = "PostgreSQL username"
  type        = string
}

variable "database_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}

variable "network_name" {
  description = "Docker network where PostgreSQL will run"
  type        = string
}
