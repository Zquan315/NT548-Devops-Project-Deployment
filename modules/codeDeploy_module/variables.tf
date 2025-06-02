variable "code_deploy_app_name" {
    description = "Name of the CodeDeploy application"
    type        = string
}

variable "compute_platform" {
    description = "Compute platform for the CodeDeploy application (e.g., 'EC2/on-premises', 'Lambda', 'ECS')"
    type        = string
}

variable "deployment_group_name" {
    description = "Name of the CodeDeploy deployment group"
    type        = string
}

variable "code_deploy_role_arn" {
    description = "ARN of the IAM role for CodeDeploy"
    type        = string
}

variable "deployment_option" {
    description = "Deployment option for CodeDeploy (e.g., 'WITH_TRAFFIC_CONTROL', 'WITHOUT_TRAFFIC_CONTROL')"
    type        = string
}

variable "autoscaling_groups" {
    description = "List of Auto Scaling group names to be associated with the deployment group"
    type        = list(string)
}

variable "target_group_name" {
    description = "Name of the target group for the deployment"
    type        = string
  
}