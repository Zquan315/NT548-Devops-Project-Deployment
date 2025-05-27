variable "project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "service_role_arn" {
  description = "IAM role ARN that AWS CodeBuild uses"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket to store build artifacts"
  type        = string
}

variable "codecommit_repo_name" {
  description = "name of the CodeCommit repository"
  type        = string
}

