output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}

output "db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = module.rds.db_instance_identifier
}

output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = module.rds.db_instance_endpoint
}

output "db_name" {
  description = "The name of database"
  value       = module.rds.db_name
  sensitive   = true
}

output "db_username" {
  description = "The username for the database"
  value       = module.rds.db_username
  sensitive   = true
}

output "db_password" {
  description = "The password for the database"
  value       = module.rds.db_password
  sensitive   = true
}

output "rds_sg_id" {
  description = "The ID of the RDS security group"
  value       = module.rds.rds_sg_id
}

output "alb_arn" {
  description = "The ARN of ALB"
  value       = module.alb.alb_arn
}
output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

output "ecs_execution_role_arn" {
  description = "ARN of the ECS execution role"
  value       = module.ecs.ecs_execution_role_arn
}

output "security_group_id" {
  description = "ID of the ALB security group"
  value       = module.alb.security_group_id
}


output "notejam_target_group_arn" {
  description = "ARN of the ALB target group"
  value       = module.alb.notejam_target_group_arn
}

output "repository_url" {
  description = "ECR Repository url"
  value       = module.ecr.repository_url
}

output "ecs_cluster_id" {
  description = "The ID of the ECS cluster"
  value       = module.ecs.ecs_cluster_id
}
