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