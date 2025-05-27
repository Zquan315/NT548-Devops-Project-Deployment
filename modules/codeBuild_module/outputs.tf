output "codebuild_project_name" {
  value       = aws_codebuild_project.this.name
  description = "Name of the CodeBuild project"
}

output "codebuild_project_arn" {
  value       = aws_codebuild_project.this.arn
  description = "ARN of the CodeBuild project"
}
