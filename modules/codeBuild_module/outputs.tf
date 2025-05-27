output "nhom16-app-student-codebuild-project_name" {
  value       = aws_codebuild_project.nhom16-app-student-codebuild-project.name
  description = "Name of the CodeBuild project"
}

output "nhom16-app-student-codebuild-project_arn" {
  value       = aws_codebuild_project.nhom16-app-student-codebuild-project.arn
  description = "ARN of the CodeBuild project"
}
