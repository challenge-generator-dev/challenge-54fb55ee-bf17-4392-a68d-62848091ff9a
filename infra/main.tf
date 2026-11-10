# Módulo principal del servicio de órdenes
# Este módulo encapsula todos los recursos de infraestructura necesarios
# para desplegar el servicio de órdenes en AWS

module "orders_service" {
  source = "./modules/orders-service"

  # Argumentos que el módulo orders-service acepta
  # El módulo define sus propias variables de entrada
  name = var.environment != "" ? "orders-${var.environment}" : "orders"

  tags = var.tags
}

# Data source para obtener información de la cuenta de AWS
data "aws_caller_identity" "current" {}

# Data source para obtener la zona horaria
data "aws_region" "current" {}