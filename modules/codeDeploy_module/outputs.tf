output "nhom16_code_deploy_app_arn" {
  description = "The ARN of the CodeDeploy IAM role created by the module."
  value       = aws_codedeploy_app.nhom16_code_deploy_app.arn
}

output "nhom16_code_deploy_deployment_group_arn" {
  description = "The ARN of the CodeDeploy deployment group created by the module."
  value       = aws_codedeploy_deployment_group.nhom16_code_deploy_deployment_group.arn
}