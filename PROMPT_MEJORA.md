# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/orders-service/ec2.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/orders-service/rds.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/orders-service/s3.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/orders-service/security_groups.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/environments/dev/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `api` | `api/` | chapter, support | server | Java | - |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd api && mvn clean compile` — componente `api` (chapter, support).

### Contratos entre componentes

- `api` expone http (api: http://localhost:8080):
  - `POST /api/orders`
  - `GET /api/orders/{id}`
  - `PUT /api/orders/{id}`
  - `DELETE /api/orders/{id}`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).
- **Java**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Referencias colgando en el codigo que si esta

Cada una rompe la compilacion:

- `api/src/main/java/com/orders/application/OrderService.java` — `OrderStatus`: OrderStatus se usa en el cuerpo del archivo pero no esta importado. El proyecto lo declara en com.orders.domain.OrderStatus.
- `api/src/main/java/com/orders/infrastructure/OrderController.java` — `OrderResponseDTO.id`: Se invoca `id` sobre `OrderResponseDTO`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

## Como saber que terminaste

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd api && mvn clean compile)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Backend, Especialidad Desarrollador, Tecnología Java, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261109223818458), Aprovisiona con Terraform la infraestructura AWS que necesita el servicio de ordenes

### Misión / candidato
Versionar la infraestructura del servicio

### Reto
- Tema: Infraestructura como codigo para el servicio de ordenes
- Seniority: senior-l2
- Tipo: practical
- Título: Aprovisionamiento de Infraestructura con Terraform para el Servicio de Ordenes
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial de Terraform — objetivo: Configurar el entorno de Terraform para aprovisionar la infraestructura de AWS. — entregable (NO resolver): Entorno de Terraform configurado y conectado a AWS.
- Fase 2: Definición de Recursos de Infraestructura — objetivo: Definir los recursos de infraestructura necesarios en Terraform. — entregable (NO resolver): Archivos de Terraform con los recursos de infraestructura definidos.
- Fase 3: Aprovisionamiento y Versionado de la Infraestructura — objetivo: Aprovisionar la infraestructura en AWS y versionar los cambios utilizando Terraform. — entregable (NO resolver): Infraestructura aprovisionada en AWS y versionada en el repositorio de código.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
# AWS Provider Configuration
aws_region = "us-east-1"

# EC2 Configuration
instance_type = "t3.micro"
ami_id        = "ami-0c55b159cbfafe1f0"
key_name      = "dev-keypair"

# RDS Configuration
db_instance_class    = "db.t3.micro"
db_engine_version    = "15.4"
db_allocated_storage = 20
db_name              = "ordersdb"
db_username          = "admin"
db_password          = "DevPassword123!"

# S3 Configuration
s3_bucket_name = "orders-service-dev-bucket"

# Network Configuration
vpc_id     = "vpc-0123456789abcdef0"
subnet_ids = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]

// === ARCHIVO: infra/providers.tf ===
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

// === ARCHIVO: infra/variables.tf ===
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

// === ARCHIVO: infra/environments/dev/variables.tf ===
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

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = ">= 1.9.0"
}

# TODO(reto): Completar la configuración de versiones de providers adicionales si es necesario
# Este archivo define las versiones requeridas de Terraform y los providers necesarios
# para el proyecto. Por ejemplo, si se necesitan otros providers como random, local, etc.

// === ARCHIVO: infra/main.tf ===
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

// === ARCHIVO: infra/outputs.tf ===
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

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/modules/orders-service/ec2.tf ===
# STUB: Implementar recurso EC2 para el servicio de órdenes
# Este archivo define la instancia de compute que ejecutará el servicio

# TODO: Definir aws_instance para el servicio de órdenes
# Consideraciones:
# - Tipo de instancia apropiado para un servicio de backend
# - Configuración de red (subnet, security groups)
# - Tags para identificación

// === ARCHIVO: infra/modules/orders-service/rds.tf ===
# STUB: Implementar recurso RDS para base de datos del servicio de órdenes
# Este archivo define la base de datos PostgreSQL/MySQL del servicio

# TODO: Definir aws_db_instance para el servicio de órdenes
# Consideraciones:
# - Motor de base de datos (PostgreSQL recomendado para fintech)
# - Configuración de almacenamiento y backups
# - Configuración de seguridad (security groups, encryption)
# - Multi-AZ para alta disponibilidad

// === ARCHIVO: infra/modules/orders-service/s3.tf ===
# STUB: Implementar recurso S3 para almacenamiento del servicio de órdenes
# Este archivo define el bucket para logs y archivos estáticos

# TODO: Definir aws_s3_bucket para el servicio de órdenes
# Consideraciones:
# - Configuración de versionado
# - Lifecycle rules para optimización de costos
# - Bucket policy para acceso controlado
# - Encriptación en reposo

// === ARCHIVO: infra/modules/orders-service/security_groups.tf ===
# Security Groups para el Servicio de Órdenes
# Superficie de práctica: completar según los requisitos de seguridad del servicio

# Security Group para las instancias EC2 del servicio de órdenes
resource "aws_security_group" "orders_ec2" {
  name        = var.ec2_security_group_name
  description = "Security group para instancias EC2 del servicio de órdenes"
  vpc_id      = var.vpc_id

  tags = {
    Name        = var.ec2_security_group_name
    Environment = var.environment
    Service     = "orders"
  }
}

# Security Group para la base de datos RDS del servicio de órdenes
resource "aws_security_group" "orders_rds" {
  name        = var.rds_security_group_name
  description = "Security group para RDS del servicio de órdenes"
  vpc_id      = var.vpc_id

  tags = {
    Name        = var.rds_security_group_name
    Environment = var.environment
    Service     = "orders"
  }
}

# Security Group para el bucket S3 del servicio de órdenes
resource "aws_security_group" "orders_s3_endpoint" {
  name        = var.s3_endpoint_security_group_name
  description = "Security group para endpoint S3 del servicio de órdenes"
  vpc_id      = var.vpc_id

  tags = {
    Name        = var.s3_endpoint_security_group_name
    Environment = var.environment
    Service     = "orders"
  }
}

# Reglas de entrada para el Security Group de EC2
resource "aws_vpc_security_group_ingress_rule" "orders_ec2_https" {
  for_each = toset(var.allowed_cidr_blocks)

  security_group_id = aws_security_group.orders_ec2.id
  cidr_ipv4         = each.value
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description       = "Permitir HTTPS desde CIDR bloque"
}

resource "aws_vpc_security_group_ingress_rule" "orders_ec2_http" {
  for_each = toset(var.allowed_cidr_blocks)

  security_group_id = aws_security_group.orders_ec2.id
  cidr_ipv4         = each.value
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "Permitir HTTP desde CIDR bloque"
}

# Reglas de salida para el Security Group de EC2
resource "aws_vpc_security_group_egress_rule" "orders_ec2_all" {
  security_group_id = aws_security_group.orders_ec2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Permitir todo el tráfico saliente"
}

# Reglas de entrada para el Security Group de RDS
resource "aws_vpc_security_group_ingress_rule" "orders_rds_from_ec2" {
  security_group_id            = aws_security_group.orders_rds.id
  referenced_security_group_id = aws_security_group.orders_ec2.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
  description                  = "Permitir PostgreSQL desde EC2 del servicio de órdenes"
}

# Reglas de salida para el Security Group de RDS
resource "aws_vpc_security_group_egress_rule" "orders_rds_all" {
  security_group_id = aws_security_group.orders_rds.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Permitir todo el tráfico saliente"
}

# Reglas de entrada para el Security Group del endpoint S3
resource "aws_vpc_security_group_ingress_rule" "orders_s3_from_ec2" {
  security_group_id            = aws_security_group.orders_s3_endpoint.id
  referenced_security_group_id = aws_security_group.orders_ec2.id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
  description                  = "Permitir HTTPS desde EC2 del servicio de órdenes"
}

# Reglas de salida para el Security Group del endpoint S3
resource "aws_vpc_security_group_egress_rule" "orders_s3_all" {
  security_group_id = aws_security_group.orders_s3_endpoint.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  description       = "Permitir todo el tráfico saliente"
}

// === ARCHIVO: infra/environments/dev/main.tf ===
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

// === ARCHIVO: api/pom.xml ===
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.5.6</version>
        <relativePath/>
    </parent>

    <groupId>com.orders</groupId>
    <artifactId>orders-service</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>orders-service</name>
    <description>Service for managing orders in the fintech platform</description>

    <properties>
        <java.version>21</java.version>
        <spring-boot.version>3.5.6</spring-boot.version>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>
        <dependency>
            <groupId>org.postgresql</groupId>
            <artifactId>postgresql</artifactId>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>org.flywaydb</groupId>
            <artifactId>flyway-core</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <configuration>
                    <source>21</source>
                    <target>21</target>
                </configuration>
            </plugin>
        </plugins>
    </build>

    <repositories>
        <repository>
            <id>spring-milestones</id>
            <name>Spring Milestones</name>
            <url>https://repo.spring.io/milestone</url>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </repository>
    </repositories>
</project>

// === ARCHIVO: api/src/main/java/com/orders/OrdersApplication.java ===
package com.orders;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.client.RestTemplate;

import java.util.TimeZone;

@SpringBootApplication
@EnableConfigurationProperties
@EnableAsync
public class OrdersApplication {
    
    public static void main(String[] args) {
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        SpringApplication.run(OrdersApplication.class, args);
    }
    
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
    
    @Bean
    public String healthCheck() {
        return "Orders Service is running";
    }
}

// === ARCHIVO: api/src/main/resources/application.yml ===
spring:
  application:
    name: orders-service
  
  datasource:
    url: jdbc:postgresql://localhost:5432/orders_db
    username: ${DB_USERNAME:orders_user}
    password: ${DB_PASSWORD:orders_password}
    driver-class-name: org.postgresql.Driver
    hikari:
      maximum-pool-size: 10
      connection-timeout: 30000
      idle-timeout: 600000
      max-lifetime: 1800000
  
  jpa:
    database-platform: org.hibernate.dialect.PostgreSQLDialect
    hibernate:
      ddl-auto: validate
    properties:
      hibernate:
        format_sql: true
        show_sql: false
        use_sql_comments: true
        jdbc:
          time_zone: UTC
  
  flyway:
    enabled: true
    locations: classpath:db/migration
    baseline-on-migrate: true
    validate-on-migrate: true
    out-of-order: false
    table: schema_version
  
server:
  port: 8080
  servlet:
    context-path: /api
  
management:
  endpoints:
    web:
      exposure:
        include: health,info,metrics,prometheus
  endpoint:
    health:
      show-details: always
  
logging:
  level:
    root: INFO
    com.orders: DEBUG
    org.hibernate.SQL: DEBUG
    org.hibernate.type.descriptor.sql.BasicBinder: TRACE
    org.springframework.web: DEBUG

// === ARCHIVO: api/src/main/java/com/orders/domain/Order.java ===
package com.orders.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

@Entity
@Table(name = "orders")
public class Order {
    @Id
    private UUID id;
    
    private UUID customerId;
    
    private BigDecimal amount;
    
    @Enumerated(EnumType.STRING)
    private OrderStatus status;
    
    private LocalDateTime createdAt;
    
    private LocalDateTime updatedAt;
    
    private String description;
    
    private boolean active;

    public Order() {
        this.active = true;
    }

    public Order(UUID customerId, BigDecimal amount) {
        this.id = UUID.randomUUID();
        this.customerId = customerId;
        this.amount = Objects.requireNonNull(amount, "Amount cannot be null");
        if (amount.compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Amount must be positive");
        }
        this.status = OrderStatus.CREATED;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
        this.active = true;
    }

    public Order(UUID customerId, BigDecimal amount, String description) {
        this(customerId, amount);
        this.description = description;
    }

    @PrePersist
    protected void onCreate() {
        if (this.id == null) {
            this.id = UUID.randomUUID();
        }
        if (this.createdAt == null) {
            this.createdAt = LocalDateTime.now();
        }
        if (this.updatedAt == null) {
            this.updatedAt = LocalDateTime.now();
        }
        if (this.status == null) {
            this.status = OrderStatus.CREATED;
        }
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = LocalDateTime.now();
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public UUID getCustomerId() {
        return customerId;
    }

    public void setCustomerId(UUID customerId) {
        this.customerId = customerId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        if (amount == null || amount.compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Amount must be positive");
        }
        this.amount = amount;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
        this.updatedAt = LocalDateTime.now();
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public BigDecimal getAmountWithTax(BigDecimal taxRate) {
        if (taxRate == null || taxRate.compareTo(BigDecimal.ZERO) < 0) {
            return this.amount;
        }
        return this.amount.multiply(taxRate.add(BigDecimal.ONE)).setScale(2, RoundingMode.HALF_UP);
    }

    public BigDecimal calculateDiscount(BigDecimal discountPercentage) {
        if (discountPercentage == null || discountPercentage.compareTo(BigDecimal.ZERO) < 0) {
            return BigDecimal.ZERO;
        }
        if (discountPercentage.compareTo(BigDecimal.valueOf(100)) > 0) {
            discountPercentage = BigDecimal.valueOf(100);
        }
        return this.amount.multiply(discountPercentage).divide(BigDecimal.valueOf(100), RoundingMode.HALF_UP);
    }

    public BigDecimal getFinalAmount(BigDecimal taxRate, BigDecimal discountPercentage) {
        BigDecimal amountWithTax = getAmountWithTax(taxRate);
        BigDecimal discount = calculateDiscount(discountPercentage);
        return amountWithTax.subtract(discount).setScale(2, RoundingMode.HALF_UP);
    }

    public void cancel() {
        if (this.status == OrderStatus.COMPLETED) {
            throw new IllegalStateException("Cannot cancel a completed order");
        }
        this.status = OrderStatus.CANCELLED;
        this.updatedAt = LocalDateTime.now();
    }

    public void complete() {
        if (this.status != OrderStatus.PROCESSING) {
            throw new IllegalStateException("Only processing orders can be completed");
        }
        this.status = OrderStatus.COMPLETED;
        this.updatedAt = LocalDateTime.now();
    }

    public void startProcessing() {
        if (this.status != OrderStatus.CREATED) {
            throw new IllegalStateException("Only created orders can start processing");
        }
        this.status = OrderStatus.PROCESSING;
        this.updatedAt = LocalDateTime.now();
    }

    public boolean canBeModified() {
        return this.status == OrderStatus.CREATED && this.active;
    }

    public boolean canBeCancelled() {
        return this.status != OrderStatus.COMPLETED && this.status != OrderStatus.CANCELLED && this.active;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Order order = (Order) o;
        return Objects.equals(id, order.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", customerId=" + customerId +
                ", amount=" + amount +
                ", status=" + status +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }

    public enum OrderStatus {
        CREATED("Created"),
        PROCESSING("Processing"),
        COMPLETED("Completed"),
        CANCELLED("Cancelled");

        private final String displayName;

        OrderStatus(String displayName) {
            this.displayName = displayName;
        }

        public String getDisplayName() {
            return displayName;
        }

        public boolean isFinal() {
            return this == COMPLETED || this == CANCELLED;
        }

        public boolean isActive() {
            return this == CREATED || this == PROCESSING;
        }
    }
}

// === ARCHIVO: api/src/main/java/com/orders/domain/OrderRepository.java ===
package com.orders.domain;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface OrderRepository {
    
    Order save(Order order);
    
    Optional<Order> findById(UUID id);
    
    void deleteById(UUID id);
    
    List<Order> findAll();
    
    List<Order> findByCustomerId(UUID customerId);
    
    List<Order> findByStatus(Order.OrderStatus status);
    
    boolean existsById(UUID id);
    
    long count();
    
    long countByStatus(Order.OrderStatus status);
}

// === ARCHIVO: api/src/main/java/com/orders/infrastructure/JpaOrderRepository.java ===
package com.orders.infrastructure;

import com.orders.domain.Order;
import com.orders.domain.OrderRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public class JpaOrderRepository implements OrderRepository {

    private final JpaRepository<Order, UUID> jpaRepository;

    public JpaOrderRepository(JpaRepository<Order, UUID> jpaRepository) {
        this.jpaRepository = jpaRepository;
    }

    @Override
    public Order save(Order order) {
        return jpaRepository.save(order);
    }

    @Override
    public Optional<Order> findById(UUID id) {
        return jpaRepository.findById(id);
    }

    @Override
    public void deleteById(UUID id) {
        jpaRepository.deleteById(id);
    }
}

// === ARCHIVO: api/src/main/java/com/orders/application/OrderService.java ===
package com.orders.application;

import com.orders.domain.Order;
import com.orders.domain.OrderRepository;
import jakarta.validation.Valid;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Optional;
import java.util.UUID;

@Service
@Transactional
public class OrderService {

    private final OrderRepository orderRepository;

    public OrderService(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    public OrderResponseDTO createOrder(@Valid OrderRequestDTO request) {
        validateOrderRequest(request);

        Order order = new Order(
            request.customerId(),
            request.amount()
        );

        Order savedOrder = orderRepository.save(order);
        return mapToResponseDTO(savedOrder);
    }

    @Transactional(readOnly = true)
    public Optional<OrderResponseDTO> getOrder(String id) {
        UUID orderId = UUID.fromString(id);
        return orderRepository.findById(orderId).map(this::mapToResponseDTO);
    }

    public Optional<OrderResponseDTO> updateOrder(String id, @Valid OrderRequestDTO request) {
        UUID orderId = UUID.fromString(id);

        return orderRepository.findById(orderId).map(existingOrder -> {
            validateOrderRequest(request);

            existingOrder.setStatus(Order.OrderStatus.valueOf(request.status()));

            Order updatedOrder = orderRepository.save(existingOrder);
            return mapToResponseDTO(updatedOrder);
        });
    }

    public boolean deleteOrder(String id) {
        UUID orderId = UUID.fromString(id);

        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isEmpty()) {
            return false;
        }

        orderRepository.deleteById(orderId);
        return true;
    }

    private void validateOrderRequest(OrderRequestDTO request) {
        if (request == null) {
            throw new IllegalArgumentException("Order request cannot be null");
        }

        if (request.customerId() == null) {
            throw new IllegalArgumentException("Customer ID is required");
        }

        if (request.amount() == null) {
            throw new IllegalArgumentException("Amount is required");
        }

        if (request.amount().compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Amount must be greater than zero");
        }

        if (request.status() == null || request.status().isBlank()) {
            throw new IllegalArgumentException("Status is required");
        }

        try {
            Order.OrderStatus.valueOf(request.status());
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Invalid order status: " + request.status());
        }
    }

    private OrderResponseDTO mapToResponseDTO(Order order) {
        return OrderResponseDTO.fromDomain(order);
    }
}

// === ARCHIVO: api/src/main/java/com/orders/infrastructure/OrderController.java ===
package com.orders.infrastructure;

import com.orders.application.OrderRequestDTO;
import com.orders.application.OrderResponseDTO;
import com.orders.application.OrderService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.Optional;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping
    public ResponseEntity<OrderResponseDTO> createOrder(@Valid @RequestBody OrderRequestDTO request) {
        OrderResponseDTO createdOrder = orderService.createOrder(request);

        URI location = ServletUriComponentsBuilder
            .fromCurrentRequest()
            .path("/{id}")
            .buildAndExpand(createdOrder.id())
            .toUri();

        return ResponseEntity.created(location).body(createdOrder);
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderResponseDTO> getOrder(@PathVariable String id) {
        Optional<OrderResponseDTO> order = orderService.getOrder(id);

        return order
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<OrderResponseDTO> updateOrder(
            @PathVariable String id,
            @Valid @RequestBody OrderRequestDTO request) {

        Optional<OrderResponseDTO> updatedOrder = orderService.updateOrder(id, request);

        return updatedOrder
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOrder(@PathVariable String id) {
        boolean deleted = orderService.deleteOrder(id);

        if (deleted) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}

// === ARCHIVO: api/src/main/resources/db/migration/V1__Initial_schema.sql ===
-- Migración inicial para el esquema de órdenes
-- Crea la tabla de órdenes con todos los campos necesarios para el dominio

CREATE TABLE orders (
    id UUID PRIMARY KEY,
    customer_id UUID NOT NULL,
    amount NUMERIC(19, 4) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_amount_positive CHECK (amount > 0),
    CONSTRAINT chk_status_valid CHECK (status IN ('PENDING', 'CONFIRMED', 'PROCESSING', 'COMPLETED', 'CANCELLED', 'FAILED'))
);

CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_created_at ON orders(created_at);

COMMENT ON TABLE orders IS 'Almacena las órdenes de compra del sistema de fintech';
COMMENT ON COLUMN orders.id IS 'Identificador único de la orden';
COMMENT ON COLUMN orders.customer_id IS 'Identificador del cliente que realizó la orden';
COMMENT ON COLUMN orders.amount IS 'Monto total de la orden';
COMMENT ON COLUMN orders.status IS 'Estado actual de la orden (PENDING, CONFIRMED, PROCESSING, COMPLETED, CANCELLED, FAILED)';
COMMENT ON COLUMN orders.created_at IS 'Fecha y hora de creación de la orden';
COMMENT ON COLUMN orders.updated_at IS 'Fecha y hora de última modificación de la orden';

// === ARCHIVO: api/src/main/java/com/orders/application/OrderRequestDTO.java ===
package com.orders.application;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import java.math.BigDecimal;
import java.util.UUID;

public record OrderRequestDTO(
    @NotNull(message = "El ID del cliente es obligatorio")
    UUID customerId,
    @NotNull(message = "El monto es obligatorio")
    @Positive(message = "El monto debe ser mayor a cero")
    BigDecimal amount
) {}

// === ARCHIVO: api/src/main/java/com/orders/application/OrderResponseDTO.java ===
package com.orders.application;

import com.orders.domain.Order;
import com.orders.domain.Order.OrderStatus;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

public record OrderResponseDTO(
    UUID id,
    UUID customerId,
    BigDecimal amount,
    String status,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {
    public static OrderResponseDTO fromDomain(Order order) {
        return new OrderResponseDTO(
            order.getId(),
            order.getCustomerId(),
            order.getAmount(),
            order.getStatus().name(),
            order.getCreatedAt(),
            order.getUpdatedAt()
        );
    }

    public static OrderResponseDTO fromDomain(UUID id, UUID customerId, BigDecimal amount, 
                                               String status, LocalDateTime createdAt, LocalDateTime updatedAt) {
        return new OrderResponseDTO(id, customerId, amount, status, createdAt, updatedAt);
    }

    public boolean isCompleted() {
        return OrderStatus.COMPLETED.name().equals(this.status);
    }

    public boolean isCancelled() {
        return OrderStatus.CANCELLED.name().equals(this.status);
    }

    public boolean isProcessing() {
        return OrderStatus.PROCESSING.name().equals(this.status);
    }

    public boolean isCreated() {
        return OrderStatus.CREATED.name().equals(this.status);
    }

    public OrderStatus getOrderStatus() {
        try {
            return OrderStatus.valueOf(this.status);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}
```
