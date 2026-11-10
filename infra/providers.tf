terraform {
  required_version = ">= 1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = "orders-service"
      ManagedBy   = "Terraform"
    }
  }
}

variable "aws_profile" {
  description = "Perfil de AWS configurado en ~/.aws/credentials"
  type        = string
  default     = "default"
}

variable "assume_role_arn" {
  description = "ARN del rol de AWS a asumir para la ejecución de Terraform"
  type        = string
  default     = null
}

locals {
  assume_role_configured = var.assume_role_arn != null
}

provider "aws" {
  alias  = "assume_role"
  region = var.aws_region

  dynamic "assume_role" {
    for_each = local.assume_role_configured ? [1] : []
    content {
      role_arn = var.assume_role_arn
    }
  }

  default_tags {
    tags = {
      Environment = var.environment
      Project     = "orders-service"
      ManagedBy   = "Terraform"
    }
  }
}

output "aws_region" {
  description = "Región de AWS donde se aprovisiona la infraestructura"
  value       = var.aws_region
}

output "environment" {
  description = "Entorno para el que se aprovisiona la infraestructura"
  value       = var.environment
}