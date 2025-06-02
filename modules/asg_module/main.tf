resource "aws_launch_template" "nhom16_launch_template" {
  name_prefix   = "nhom16_launch_template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile {
    name = var.ec2_instance_profile_name
  }

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
    subnet_id                   = var.subnet_id_public
    security_groups             = var.security_group_id_public
  }

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }
  }

  user_data = base64encode(<<-EOF
                #!/bin/bash 
                mkdir /home/ubuntu/student-management-app 
                sudo chown -R ubuntu:ubuntu /home/ubuntu/student-management-app 
                sudo chmod -R 777 /home/ubuntu/student-management-app
                sudo apt update -y 
                sudo apt install -y ruby wget 
                cd /home/ubuntu 
                wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install 
                chmod +x ./install 
                sudo ./install auto 
            EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "nhom16_instance"
    }
  }
}

resource "aws_autoscaling_group" "nhom16_asg" {
  name                = "nhom16_asg"
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
  vpc_zone_identifier = var.subnet_ids
  target_group_arns   = var.target_group_arns
  launch_template {
    id      = aws_launch_template.nhom16_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "ASG_Name"
    value               = "nhom16_asg"
    propagate_at_launch = true
  }

  health_check_type         = "ELB"
  health_check_grace_period = 900
  depends_on = [var.target_group_arns ]
}




# test alarms for scaling policies
resource "aws_sns_topic" "nhom16_cloudwatch_alarms_topic" {
  name = "nhom16_cloudwatch_alarms_topic"
}
# Tạo Subscription cho email
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.nhom16_cloudwatch_alarms_topic.arn
  protocol  = "email"
  endpoint  = "tocongquan315@gmail.com"
}

resource "aws_autoscaling_policy" "nhom16_scale_out_policy" {
  name                   = "nhom16_scale_out_policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.nhom16_asg.name
}

resource "aws_autoscaling_policy" "nhom16_scale_in_policy" {
  name                   = "nhom16_scale_in_policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.nhom16_asg.name
}

resource "aws_cloudwatch_metric_alarm" "nhom16_cpu_high" {
  alarm_name          = "nhom16-cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Scale out when CPU >= 70%"
  alarm_actions       = [aws_autoscaling_policy.nhom16_scale_out_policy.arn,
                         aws_sns_topic.nhom16_cloudwatch_alarms_topic.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.nhom16_asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "nhom16_cpu_low" {
  alarm_name          = "nhom16-cpu-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Scale in when CPU <= 50%"
  alarm_actions       = [aws_autoscaling_policy.nhom16_scale_in_policy.arn,
                         aws_sns_topic.nhom16_cloudwatch_alarms_topic.arn]      
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.nhom16_asg.name
  }
}