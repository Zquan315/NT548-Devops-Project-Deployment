# variables for codeDeploy
variable "code_deploy_app_name_value" {
  description = "Name of the CodeDeploy application"
  type        = string
}
variable "compute_platform_value" {
  description = "Compute platform for the CodeDeploy application (e.g., 'EC2/on-premises', 'Lambda', 'ECS')"
  type        = string
}
variable "deployment_group_name_value" {
  description = "Name of the CodeDeploy deployment group"
  type        = string
}
variable "deployment_option_value" {
  description = "Deployment option for CodeDeploy (e.g., 'WITH_TRAFFIC_CONTROL', 'WITHOUT_TRAFFIC_CONTROL')"
  type        = string
}
variable "ec2_tag_name_value" {
  description = "Tag name for EC2 instances in the deployment group"
  type        = string
  
}

# variables for codeBuild
variable "code_build_project_name_value" {
  description = "Name of the CodeBuild project"
  type        = string
}

# variables for codePipeline
variable "code_pipeline_name_value" {
  description = "Name of the CodePipeline"
  type        = string
}