# Definición de variables para parametrizar la infraestructura del servicio de órdenes
# Estas variables permiten adaptar la infraestructura a diferentes entornos y configuraciones

variable "aws_region" {
  description = "Región de AWS donde se aprovisionarán los recursos"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno para el cual se aprovisiona la infraestructura (ej: dev, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr_block" {
  description = "Bloque CIDR para la VPC del servicio de órdenes"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "Lista de bloques CIDR para las subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "Lista de bloques CIDR para las subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Espacio de almacenamiento asignado para la base de datos RDS (en GB)"
  type        = number
  default     = 20
}

variable "db_engine_version" {
  description = "Versión del motor de la base de datos RDS"
  type        = string
  default     = "15.4"
}

variable "db_name" {
  description = "Nombre de la base de datos RDS"
  type        = string
  default     = "ordersdb"
}

variable "db_username" {
  description = "Usuario maestro para la base de datos RDS"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Contraseña para el usuario maestro de la base de datos RDS"
  type        = string
  sensitive   = true
}

variable "ec2_instance_type" {
  description = "Tipo de instancia EC2 para el servicio de órdenes"
  type        = string
  default     = "t3.micro"
}

variable "ec2_key_name" {
  description = "Nombre del par de claves SSH para acceder a las instancias EC2"
  type        = string
}

variable "s3_bucket_name" {
  description = "Nombre del bucket S3 para almacenar archivos relacionados con las órdenes"
  type        = string
}

variable "tags" {
  description = "Tags adicionales para aplicar a todos los recursos"
  type        = map(string)
  default     = {}
}