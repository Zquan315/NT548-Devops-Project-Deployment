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

variable "codebuild_role_name" {
  description = "Name of the IAM role for CodeBuild"
  type        = string
}
variable "code_build_dev_access_policy_arn" {
  description = "ARN of the CodeBuild developer access policy"
  type        = string
  
}

variable "code_pipeline_role_name" {
  description = "Name of the IAM role for CodePipeline"
  type        = string 
}
variable "code_pipeline_policy_arn_list" {
  description = "ARN of the CodePipeline policy for the role"
  type        = list(string)
}