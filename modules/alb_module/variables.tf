variable "load_balancer_type" {
  description = "NaTypeme of the ALB"
  type        = string
  default = "application"
}

variable "alb_security_group_id" {
  description = "List of security group IDs for the ALB"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the ALB and target group will be created"
  type        = string
}

variable "frontend_port" {
  description = "Port for the frontend target group"
  type        = number
}
variable "backend_port" {
  description = "Port for the backend target group"
  type        = number
}
variable "http_port" {
  description = "Port for the HTTP listener"
  type        = number
  default     = 80
}
