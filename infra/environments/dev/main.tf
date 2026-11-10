# TODO(reto): Completar la definición de recursos para el entorno de desarrollo
# Este archivo debería definir la infraestructura específica del entorno de desarrollo
# utilizando los módulos disponibles y las variables apropiadas.

# Proveedor de AWS para el entorno de desarrollo
provider "aws" {
  region = var.aws_region
}

module "orders_service" {
  source = "../../modules/orders-service"

  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  instance_type        = var.instance_type
  instance_key_name    = var.instance_key_name
  bucket_name          = var.bucket_name
  allowed_cidr_blocks  = var.allowed_cidr_blocks

  tags = {
    Environment = var.environment
    Project     = "orders-service"
  }
}

resource "aws_security_group" "orders_app" {
  name        = "orders-app-sg-${var.environment}"
  description = "Security group para la aplicación de órdenes"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP para la aplicación"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Salida permitida a internet"
  }

  tags = {
    Name        = "orders-app-sg-${var.environment}"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket" "orders_logs" {
  bucket = "orders-logs-${var.environment}-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "orders-logs-${var.environment}"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

data "aws_caller_identity" "current" {}