variable "bucket_name_value" {
  description = "The name of the S3 bucket to create."
  type        = string
}

variable "versioning_enabled_value" {
  description = "Enable versioning for the S3 bucket."
  type        = bool
  default     = true
}


variable "block_public_acls" {
  description = "Block public ACLs for the S3 bucket."
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Block public policies for the S3 bucket."
  type        = bool
  default     = true
}
variable "ignore_public_acls" {
  description = "Ignore public ACLs for the S3 bucket."
  type        = bool
  default     = true
}
variable "restrict_public_buckets" {
  description = "Restrict public buckets for the S3 bucket."
  type        = bool
  default     = true
}