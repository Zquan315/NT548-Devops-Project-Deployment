resource "aws_codedeploy_app" "nhom16_code_deploy_app" {
    name             = var.code_deploy_app_name
    compute_platform = var.compute_platform
}

resource "aws_codedeploy_deployment_group" "nhom16_code_deploy_deployment_group" {
    app_name              = aws_codedeploy_app.nhom16_code_deploy_app.name
    deployment_group_name = var.deployment_group_name
    service_role_arn      = var.code_deploy_role_arn

    deployment_style {
        deployment_type = "IN_PLACE"
        deployment_option = var.deployment_option
    }
    
    ec2_tag_filter {
        key   = "Name"
        value = var.ec2_tag_value
        type  = "KEY_AND_VALUE"
    }

    deployment_config_name = "CodeDeployDefault.OneAtATime"
    
    # load_balancer_info {
    #     elb_info {
    #     name = var.elb_name
    #     }
    # }

    auto_rollback_configuration {
        enabled = true
        events  = ["DEPLOYMENT_FAILURE"]
    }
  
}