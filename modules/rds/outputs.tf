output "db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = aws_db_instance.rds.id
}

output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.rds.endpoint
}

output "db_instance_endpoint_without_port" {
  description = "The endpoint of the RDS instance without the port"
  value       = replace(aws_db_instance.rds.endpoint, "/:\\d+$/", "")
}
output "db_name" {
  description = "The username for the database"
  value       = aws_db_instance.rds.db_name
}
output "db_username" {
  description = "The username for the database"
  value       = aws_db_instance.rds.username
}

output "db_password" {
  description = "The password for the database"
  value       = aws_db_instance.rds.password
}

output "rds_sg_id" {
  description = "The ID of the RDS security group"
  value       = aws_security_group.rds_sg.id
}
