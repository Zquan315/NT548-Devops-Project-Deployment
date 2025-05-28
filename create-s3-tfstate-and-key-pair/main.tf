resource "aws_s3_bucket" "nhom16-terraform-state-bucket" {
    bucket = "nhom16-terraform-state-bucket"
    force_destroy = true
    tags = {
        Name = "nhom16-terraform-state-bucket"
    }
}

resource "aws_s3_bucket_versioning" "nhom16-terraform-state-bucket-versioning" {
    bucket = aws_s3_bucket.nhom16-terraform-state-bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_public_access_block" "nhom16-app-student-buckett-public-access-block" {
    bucket = aws_s3_bucket.nhom16-terraform-state-bucket.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
  
}

resource "aws_key_pair" "nhom16" {
    key_name   = "nhom16"
    public_key = file("~/.ssh/id_rsa.pub")
}