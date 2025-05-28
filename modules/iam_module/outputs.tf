output "nhom16_ec2_role_arn" {
  description = "The ARN of the IAM role created by the module."
  value       = aws_iam_role.nhom16_ec2_role.arn
}

output "nhom16_codeDeploy_role_arn" {
  description = "The ARN of the CodeDeploy IAM role created by the module."
  value       = aws_iam_role.nhom16_codeDeploy_role.arn
}

output "nhom16_ec2_role_name" {
  description = "The ARN of the IAM role created by the module."
  value       = aws_iam_role.nhom16_ec2_role.name
}

output "nhom16_codeDeploy_role_name" {
  description = "The ARN of the CodeDeploy IAM role created by the module."
  value       = aws_iam_role.nhom16_codeDeploy_role.name
}

output "nhom16_instance_profile_name" {
  description = "The name of the IAM instance profile created by the module."
  value       = aws_iam_instance_profile.nhom16_instance_profile.name
}

output "nhom16_codebuild_role_arn" {
  description = "The ARN of the CodeBuild IAM role created by the module."
  value       = aws_iam_role.nhom16_codeBuild_role.arn
}

output "nhom16_code_pipeline_role_arn" {
  description = "The ARN of the CodePipeline IAM role created by the module."
  value       = aws_iam_role.nhom16_codePipeline_role.arn
  
}