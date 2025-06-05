output "nhom16_alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.nhom16_alb.dns_name
  
}

output "nhom16_tg_frontend_arn" {
  description = "The ARN of the frontend target group"
  value       = aws_lb_target_group.nhom16_tg_frontend.arn
}

output "nhom16_tg_backend_arn" {
  description = "The ARN of the backend target group"
  value       = aws_lb_target_group.nhom16_tg_backend.arn
}

output "nhom16_tg_backend_name" {
  description = "The name of the backend target group"
  value       = aws_lb_target_group.nhom16_tg_backend.name
}

output "nhom16_alb_zone_id" {
  description = "The zone ID of the Application Load Balancer"
  value       = aws_lb.nhom16_alb.zone_id
  
}