# Outputs que exponen la información relevante de la infraestructura
# aprovisionada para el servicio de órdenes

output "orders_service_endpoint" {
  description = "Endpoint público del servicio de órdenes"
  value       = module.orders_service.public_dns
}

output "orders_service_public_ip" {
  description = "Dirección IP pública del servicio de órdenes"
  value       = module.orders_service.public_ip
}

output "orders_database_endpoint" {
  description = "Endpoint de la base de datos de órdenes"
  value       = module.orders_service.database_endpoint
}

output "orders_database_name" {
  description = "Nombre de la base de datos de órdenes"
  value       = module.orders_service.database_name
}

output "orders_s3_bucket" {
  description = "Nombre del bucket S3 para almacenamiento de órdenes"
  value       = module.orders_service.s3_bucket_name
}

output "orders_security_group_id" {
  description = "ID del security group del servicio de órdenes"
  value       = module.orders_service.security_group_id
}

output "database_security_group_id" {
  description = "ID del security group de la base de datos"
  value       = module.orders_service.database_security_group_id
}

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.orders_service.vpc_id
}

output "account_id" {
  description = "ID de la cuenta de AWS"
  value       = data.aws_caller_identity.current.account_id
}

output "current_region" {
  description = "Región actual de AWS"
  value       = data.aws_region.current.name
}