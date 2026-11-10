# Infraestructura como Código - Servicio de Órdenes

Este proyecto contiene la definición de infraestructura en AWS utilizando Terraform para el servicio de órdenes de la plataforma fintech.

## Estructura del Proyecto

```
infra/
├── environments/
│   └── dev/
│       ├── main.tf          # Configuración específica del entorno de desarrollo
│       ├── terraform.tfvars # Variables específicas del entorno
│       └── variables.tf     # Definición de variables del entorno
├── modules/
│   └── orders-service/
│       ├── main.tf          # Punto de entrada del módulo
│       ├── ec2.tf           # Instancia EC2 para el servicio
│       ├── rds.tf           # Base de datos PostgreSQL
│       ├── s3.tf            # Bucket S3 para almacenamiento
│       ├── security_groups.tf # Grupos de seguridad
│       ├── variables.tf     # Variables de entrada del módulo
│       └── outputs.tf       # Outputs del módulo
├── main.tf                  # Punto de entrada principal que invoca módulos
├── versions.tf              # Versiones de providers y Terraform
├── variables.tf             # Variables globales del proyecto
├── providers.tf             # Configuración de providers
└── outputs.tf               # Outputs del proyecto
```

## Requisitos Previos

- Terraform >= 1.9.0
- AWS CLI configurado con credenciales válidas
- Acceso a la cuenta de AWS especificada

## Configuración Inicial

### 1. Configurar credenciales de AWS

```bash
aws configure
```

O configurar variables de entorno:

```bash
export AWS_ACCESS_KEY_ID="tu-access-key"
export AWS_SECRET_ACCESS_KEY="tu-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
```

### 2. Inicializar Terraform

```bash
cd infra
terraform init
```

Este comando descarga los providers necesarios y configura el backend.

## Comandos de Uso

### Planificar cambios

```bash
cd infra/environments/dev
terraform plan -var-file="terraform.tfvars"
```

Muestra los recursos que se crearán, modificarán o eliminarán sin aplicar cambios.

### Aplicar cambios

```bash
cd infra/environments/dev
terraform apply -var-file="terraform.tfvars"
```

Aprovisiona la infraestructura en AWS. Requiere confirmación explícita.

### Destruir infraestructura

```bash
cd infra/environments/dev
terraform destroy -var-file="terraform.tfvars"
```

Elimina todos los recursos aprovisionados. Usar con precaución.

### Formatear código

```bash
cd infra
terraform fmt -recursive
```

Formatea todos los archivos .tf según las convenciones de Terraform.

### Validar configuración

```bash
cd infra
terraform validate
```

Valida la sintaxis y consistencia de los archivos de Terraform.

## Arquitectura de Módulos

### Módulo orders-service

El módulo principal `orders-service` encapsula todos los recursos necesarios:

**Variables de entrada:**
- `environment` - Entorno de despliegue (dev, prod)
- `vpc_cidr` - CIDR de la VPC
- `availability_zones` - Zonas de disponibilidad
- `db_instance_class` - Clase de instancia RDS
- `db_allocated_storage` - Almacenamiento allocated para RDS
- `instance_type` - Tipo de instancia EC2
- `instance_key_name` - Nombre de key pair para EC2
- `bucket_name` - Nombre del bucket S3
- `allowed_cidr_blocks` - CIDRs permitidos para acceso
- `tags` - Tags adicionales para recursos

**Recursos aprovisionados:**
- Instancia EC2 para la aplicación
- Base de datos RDS PostgreSQL
- Bucket S3 para almacenamiento
- Security groups para control de acceso

## Outputs del Módulo

Los outputs disponibles después de aplicar:

- `ec2_public_ip` - IP pública de la instancia EC2
- `rds_endpoint` - Endpoint de la base de datos RDS
- `s3_bucket_name` - Nombre del bucket S3
- `security_group_id` - ID del grupo de seguridad principal

## Gestión de Entornos

La infraestructura está segregada por entornos:

- **dev/** - Entorno de desarrollo con recursos mínimos
- **prod/** - Entorno de producción con alta disponibilidad

Cada entorno tiene su propio:
- `main.tf` con configuración específica
- `terraform.tfvars` con valores de variables
- `variables.tf` con definiciones locales

## Mejores Prácticas

- Usar módulos para reutilizar configuración
- Parametrizar todo con variables
- Etiquetar recursos para identificación
- Versionar cambios con Git
- Revisar planes antes de aplicar
- Usar remote state en producción

## Notas

- Los cambios deben ser revisados con `terraform plan` antes de aplicar
- Se recomienda usar workspaces para gestionar múltiples entornos
- Los outputs del módulo facilitan la integración con otros servicios
- Los security groups controlan el acceso a los recursos de AWS