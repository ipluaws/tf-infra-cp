provider "aws" {
  region = "eu-central-1"
}

terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "cpartner-terraform-state-infra"
    key            = "infra/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locks-infra" # Optional, for state locking
  }

}

module "vpc" {
  source = "./modules/vpc"
  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  availability_zones      = var.availability_zones
}

module "rds" {
  source                  = "./modules/rds"
  allocated_storage       = var.rds_allocated_storage
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  instance_class          = var.rds_instance_class
  db_name                 = var.db_name
  db_username             = var.db_username
  db_password             = var.db_password
  parameter_group_name    = var.rds_parameter_group_name
  vpc_security_group_ids  = [module.rds.rds_sg_id]
  subnet_ids              = module.vpc.private_subnet_ids
  db_subnet_group_name    = "${var.vpc_name}-rds-subnet-group"
  db_instance_name        = "${var.vpc_name}-rds"
  vpc_id                  = module.vpc.vpc_id
  vpc_name                = var.vpc_name
}

module "ecr" {
  source = "./modules/ecr"
  repository_name = var.ecr_repository_name
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = "demo-cluster"
}

module "alb" {
  source           = "./modules/alb"
  vpc_id           = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_name         = "demo-alb"
}

resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = "/ecs/notejam"
  retention_in_days = 7  # Keep logs for 7 days
}
