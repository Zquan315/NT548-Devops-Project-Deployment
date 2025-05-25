variable "ec2_role_name" {
  description = "Name of the IAM role for EC2 instances"
  type        = string
}

variable "code_deploy_role_name" {
  description = "Name of the IAM role for CodeDeploy"
  type        = string
  
}

variable "nhom16_user_name" {
  description = "Name of the IAM user"
  type        = string
  
}