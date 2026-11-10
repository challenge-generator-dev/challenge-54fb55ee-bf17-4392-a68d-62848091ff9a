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