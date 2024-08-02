output "alb_arn" {
  description = "ARN of the ALB"
  value       = aws_lb.demo_alb.arn
}


output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.ecs_service.id
}

output "alb_dns_name" {
  value = aws_lb.demo_alb.dns_name
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = var.vpc_id
}


output "notejam_target_group_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.notejam_tg.arn
}
