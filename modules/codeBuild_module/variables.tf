variable "project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "description" {
  description = "Description of the CodeBuild project"
  type        = string
  default     = ""
}

variable "service_role_arn" {
  description = "IAM role ARN that AWS CodeBuild uses"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket to store build artifacts"
  type        = string
}

variable "codecommit_repo_url" {
  description = "URL of the CodeCommit repository"
  type        = string
}

variable "buildspec_file" {
  description = "Path to buildspec file in the repository (optional)"
  type        = string
  default     = ""
}

variable "log_group_name" {
  description = "Name of the CloudWatch log group"
  type        = string
}

variable "log_stream_name" {
  description = "Name of the CloudWatch log stream"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
