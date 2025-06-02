output "nhom16_codeDeploy_role_arn" {
  value = module.iam_module.nhom16_codeDeploy_role_arn
}

output "nhom16_codebuild_role_arn" {
  value = module.iam_module.nhom16_codebuild_role_arn
}

output "nhom16-app_student_bucket_bucket" {
  value = module.s3_module.nhom16-app_student_bucket_bucket
}

output "nhom16_app_student_repository_name" {
  value = module.codeCommit_module.nhom16_app_student_repository_name
}

output "nhom16_code_pipeline_role_arn" {
  value = module.iam_module.nhom16_code_pipeline_role_arn
}

output "nhom16_asg_name" {
  value = module.asg_module.nhom16_asg_name
}

output "nhom16_tg_backend_name" {
  value = module.alb_module.nhom16_tg_backend_name
}