# Aprovisionamiento de Infraestructura con Terraform para el Servicio de Ordenes

El equipo de desarrollo del servicio de ordenes en la empresa de fintech requiere aprovisionar su infraestructura en AWS utilizando Terraform. El objetivo es versionar la infraestructura para asegurar que el servicio pueda ser desplegado de manera consistente y reproducible. El dominio de negocio es el servicio de ordenes, que gestiona la creación, modificación y cancelación de ordenes de compra en la plataforma. Los actores involucrados son el Cliente, que realiza las ordenes, y el Sistema de Pagos, que verifica y procesa los pagos asociados a las ordenes.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el servicio de ordenes |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: JDK 17+, Maven 3.9+, IDE con soporte Java.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Ejecuta `mvn compile` en la raíz. Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración Inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform para aprovisionar la infraestructura de AWS.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los recursos de AWS necesarios para el servicio de ordenes.
- Configurar el archivo principal de Terraform con las credenciales de AWS y la configuración básica.
- Verificar que el entorno de Terraform está correctamente configurado y puede conectarse a AWS.

**Entregable:** Entorno de Terraform configurado y conectado a AWS.

<details>
<summary>Pistas de conocimiento</summary>

- Terraform permite la gestión de infraestructura como código.
- Las credenciales de AWS son necesarias para que Terraform pueda interactuar con los servicios de AWS.

</details>

### Fase 2: Definición de Recursos de Infraestructura

**Objetivo:** Definir los recursos de infraestructura necesarios en Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Definir los recursos de AWS (como EC2, RDS, S3) necesarios para el servicio de ordenes en los archivos de Terraform.
- Establecer las propiedades y configuraciones necesarias para cada recurso.
- Verificar que los recursos definidos cumplen con los requisitos del servicio de ordenes.

**Entregable:** Archivos de Terraform con los recursos de infraestructura definidos.

<details>
<summary>Pistas de conocimiento</summary>

- Cada recurso de AWS tiene propiedades y configuraciones específicas que deben ser definidas en Terraform.
- Es importante verificar que los recursos definidos cumplen con los requisitos del servicio de ordenes para asegurar su correcto funcionamiento.

</details>

### Fase 3: Aprovisionamiento y Versionado de la Infraestructura

**Objetivo:** Aprovisionar la infraestructura en AWS y versionar los cambios utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Ejecutar los comandos de Terraform para aprovisionar la infraestructura en AWS.
- Versionar los cambios en el repositorio de código utilizando Git.
- Verificar que la infraestructura aprovisionada cumple con los requisitos del servicio de ordenes.

**Entregable:** Infraestructura aprovisionada en AWS y versionada en el repositorio de código.

<details>
<summary>Pistas de conocimiento</summary>

- Los comandos de Terraform `terraform init`, `terraform plan`, y `terraform apply` son utilizados para aprovisionar la infraestructura.
- Es importante versionar los cambios en el repositorio de código para asegurar la trazabilidad y reproducibilidad de los despliegues.
- Java: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y cómo se utiliza para aprovisionar infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la infraestructura del servicio de ordenes?
- **comoSeUsa**: ¿Cómo se configura y utiliza Terraform para aprovisionar recursos de AWS?

## Criterios de Evaluacion

- Configuración inicial de Terraform.
- Definición de recursos de infraestructura en Terraform.
- Aprovisionamiento y versionado de la infraestructura en AWS.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd api && mvn clean compile)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
