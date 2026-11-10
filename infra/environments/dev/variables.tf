# Variables específicas para el entorno de desarrollo del servicio de órdenes
# Este archivo sobrescribe los valores por defecto para adaptarse al entorno dev

# Variable para definir la región de AWS específica para desarrollo
variable "aws_region" {
  description = "Región de AWS para el entorno de desarrollo"
  type        = string
  default     = "us-east-1"
}

# Variable para definir el entorno específico
variable "environment" {
  description = "Entorno de despliegue"
  type        = string
  default     = "dev"
}

# Variables para la base de datos RDS de desarrollo
variable "db_instance_class" {
  description = "Clase de instancia para la base de datos RDS en desarrollo"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Espacio de almacenamiento asignado para la base de datos RDS en desarrollo (GB)"
  type        = number
  default     = 20
}

# Variable para definir el nombre del bucket S3 específico para desarrollo
variable "s3_bucket_name" {
  description = "Nombre del bucket S3 para el entorno de desarrollo"
  type        = string
  default     = "orders-service-dev-bucket"
}

# Variable para definir el tipo de instancia EC2 para desarrollo
variable "ec2_instance_type" {
  description = "Tipo de instancia EC2 para el entorno de desarrollo"
  type        = string
  default     = "t3.micro"
}

# Variable para definir el nombre de la clave SSH para desarrollo
variable "ec2_key_name" {
  description = "Nombre del par de claves SSH para el entorno de desarrollo"
  type        = string
  default     = "orders-service-dev-key"
}