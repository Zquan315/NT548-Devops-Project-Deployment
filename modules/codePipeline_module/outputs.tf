output "pipeline_name" {
  description = "The name of the created CodePipeline"
  value       = aws_codepipeline.nhom16_app_student_pipeline.name
}

output "pipeline_arn" {
  description = "The ARN of the created CodePipeline"
  value       = aws_codepipeline.nhom16_app_student_pipeline.arn
}