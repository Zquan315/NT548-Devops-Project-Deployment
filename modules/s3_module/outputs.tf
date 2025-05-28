output "nhom16-app_student_bucket_id" {
  description = "The name of the S3 bucket created by the module."
  value       = aws_s3_bucket.nhom16-app-student-bucket-22521190.id
}

output "nhom16-app_student_bucket_arn" {
  description = "The ARN of the S3 bucket created by the module."
  value       = aws_s3_bucket.nhom16-app-student-bucket-22521190.arn
  
}

output "nhom16-app_student_bucket_bucket" {
  description = "The bucket name of the S3 bucket created by the module."
  value       = aws_s3_bucket.nhom16-app-student-bucket-22521190.bucket
  
}
