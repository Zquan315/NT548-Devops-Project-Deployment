resource "aws_codecommit_repository" "nhom16_app_student_repository" {
  repository_name = var.repository_name
  description     = var.repository_description
  
}