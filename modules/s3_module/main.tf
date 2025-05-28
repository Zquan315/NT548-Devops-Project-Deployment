resource "aws_s3_bucket" "nhom16-app-student-bucket-22521190" {
    bucket = var.bucket_name_value
    force_destroy = true
    tags = {
        Name = var.bucket_name_value
    }
}

resource "aws_s3_bucket_versioning" "nhom16-app-student-buckett-versioning" {
    bucket = aws_s3_bucket.nhom16-app-student-bucket-22521190.id
    versioning_configuration {
        status = var.versioning_enabled_value ? "Enabled" : "Suspended"
    }
}

resource "aws_s3_bucket_public_access_block" "nhom16-app-student-buckett-public-access-block" {
    bucket = aws_s3_bucket.nhom16-app-student-bucket-22521190.id

    block_public_acls       = var.block_public_acls
    block_public_policy     = var.block_public_policy
    ignore_public_acls      = var.ignore_public_acls
    restrict_public_buckets = var.restrict_public_buckets
  
}