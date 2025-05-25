output "nhom16_ec2_role_arn" {
  description = "The ARN of the IAM role created by the module."
  value       = aws_iam_role.nhom16_ec2_role.arn
}

output "nhom16_codeDeploy_role_arn" {
  description = "The ARN of the CodeDeploy IAM role created by the module."
  value       = aws_iam_role.nhom16_codeDeploy_role.arn
}