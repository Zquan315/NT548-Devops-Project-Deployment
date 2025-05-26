resource "aws_codebuild_project" "this" {
  name         = var.project_name
  description  = var.description
  service_role = var.service_role_arn

  artifacts {
    type      = "S3"
    location  = var.s3_bucket
    name      = "${var.project_name}-artifacts"
    packaging = "ZIP"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL" # 4GB RAM, 2 vCPUs, 64GB disk
    image                       = "aws/codebuild/standard:7.0" # latest managed image
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    type            = "CODECOMMIT"
    location        = var.codecommit_repo_url
    git_clone_depth = 1

    # If the buildspec_file variable is provided, use it; otherwise, use the default buildspec in the repo
    buildspec = var.buildspec_file != "" ? var.buildspec_file : null
  }

  # The branch to use for the build (master branch)
  source_version = "master"

  logs_config {
    cloudwatch_logs {
      group_name  = var.log_group_name
      stream_name = var.log_stream_name
    }
  }

  tags = var.tags
}
