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
variable "ec2_tag_value" {
    description = "Tag value for EC2 instances to be included in the deployment group"
    type        = string
}
variable "deployment_option" {
    description = "Deployment option for CodeDeploy (e.g., 'WITH_TRAFFIC_CONTROL', 'WITHOUT_TRAFFIC_CONTROL')"
    type        = string
}