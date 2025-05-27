output "nhom16_app_student_repository_id" {
  description = "ID of the CodeCommit repository"
  value       = aws_codecommit_repository.nhom16_app_student_repository.id
}

output "nhom16_app_student_repository_name" {
  description = "ARN of the CodeCommit repository"
  value       = aws_codecommit_repository.nhom16_app_student_repository.repository_name
  
}