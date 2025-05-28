data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket = "nhom16-terraform-state-bucket"
    key    = "create-infrastructure/terraform.tfstate"
    region = "us-east-1"
  }
}


# Create CodeDeploy application and deployment group
module "codeDeploy_module" {
  source = "../modules/codeDeploy_module"
  code_deploy_app_name        = var.code_deploy_app_name_value
  compute_platform            = var.compute_platform_value
  deployment_group_name       = var.deployment_group_name_value
  code_deploy_role_arn        = data.terraform_remote_state.infra.outputs.nhom16_codeDeploy_role_arn
  ec2_tag_value               = var.ec2_tag_name_value
  deployment_option           = var.deployment_option_value
}

# Create CodeBuild project
module "codeBuild_module" {
  source = "../modules/codeBuild_module"
  project_name                     = var.code_build_project_name_value
  service_role_arn                 = data.terraform_remote_state.infra.outputs.nhom16_codebuild_role_arn
  s3_bucket                        = data.terraform_remote_state.infra.outputs.nhom16-app_student_bucket_bucket 
  codecommit_repo_name             = data.terraform_remote_state.infra.outputs.nhom16_app_student_repository_name
}

# Create CodePipeline
module "codePipeline_module" {
  source = "../modules/codePipeline_module"
  pipeline_name                   = var.code_pipeline_name_value
  role_arn                        = data.terraform_remote_state.infra.outputs.nhom16_code_pipeline_role_arn
  s3_bucket                       = data.terraform_remote_state.infra.outputs.nhom16-app_student_bucket_bucket
  repository_name                 = data.terraform_remote_state.infra.outputs.nhom16_app_student_repository_name
  build_project_name              = module.codeBuild_module.nhom16-app-student-codebuild-project_name
  application_name                = module.codeDeploy_module.nhom16_code_deploy_app_name
  deployment_group_name           = module.codeDeploy_module.nhom16_code_deploy_deployment_group_name
}