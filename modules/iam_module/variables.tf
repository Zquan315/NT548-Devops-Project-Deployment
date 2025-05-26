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

variable "readonly_policy_arn" {
  description = "ARN of the read-only policy for S3"
  type        = string
}
variable "ec2_code_deploy_policy_arn" {
  description = "ARN of the CodeDeploy policy for EC2 instances"
  type        = string
}
variable "code_deploy_policy_arn" {
  description = "ARN of the CodeDeploy policy for CodeDeploy role"
  type        = string
}
variable "admin_policy_arn" {
  description = "ARN of the admin policy for IAM user"
  type        = string
  
}