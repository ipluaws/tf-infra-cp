variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
  default     = "united"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks for the public subnets"
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks for the private subnets"
  default     = ["10.0.30.0/24", "10.0.40.0/24"]
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of availability zones within your region"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance"
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "The allocated storage in gigabytes"
  default     = 20
}

variable "rds_engine" {
  description = "The database engine to use"
  default     = "postgres"
}

variable "rds_engine_version" {
  description = "The version of the database engine"
  default     = "13.13"
}

variable "db_name" {
  description = "The name of the database"
  default     = "postgres"
}

variable "db_username" {
  description = "The username for the database"
  default     = "db_user"
}

variable "db_password" {
  description = "The password for the database"
  default     = "8005258770"
  sensitive   = true
}

variable "rds_parameter_group_name" {
  description = "The name of the DB parameter group to associate"
  default     = "default.postgres13"
}

variable "ecr_repository_name" {
  description = "ECR Repository Name"
  type        = string
  default     = "notejam"
}
