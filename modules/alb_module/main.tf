# modules/load_balancer_module/main.tf
resource "aws_lb" "nhom16_alb" {
  name               = "nhom16-alb"
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = var.alb_security_group_id
  subnets            = var.public_subnet_ids
  tags = {
    Name = "nhom16-alb"
  }
}

resource "aws_lb_target_group" "nhom16_tg_frontend" {
  name     = "nhom16-tg-frontend"
  port     = var.frontend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 4
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group" "nhom16_tg_backend" {
  name     = "nhom16-tg-backend"
  port     = var.backend_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/students"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 4
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "nhom16_listener_frontend" {
  load_balancer_arn = aws_lb.nhom16_alb.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nhom16_tg_frontend.arn
  }
}

resource "aws_lb_listener_rule" "nhom16_backend_rule" {
  listener_arn = aws_lb_listener.nhom16_listener_frontend.arn
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nhom16_tg_backend.arn
  }
  condition {
    path_pattern {
      values = ["/students", "/students/*"]
    }
  }
}