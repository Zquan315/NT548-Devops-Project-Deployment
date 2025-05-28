output "nhom16_app_student_codePipeline_name" {
  description = "The name of the created CodePipeline"
  value       = aws_codepipeline.nhom16_app_student_codePipeline.name
}

output "nhom16_app_student_codePipeline_arn" {
  description = "The ARN of the created CodePipeline"
  value       = aws_codepipeline.nhom16_app_student_codePipeline.arn
}