# create VPC and subnets
module "vpc_module" {
  source = "../modules/vpc_module"
  #VPC
  cidr_block_value         = var.vpc_cidr_block_value
  cidr_block_private_value = var.vpc_cidr_block_private_value
  cidr_block_public_value  = var.vpc_cidr_block_public_value
  subnet_count_value       = var.vpc_subnet_count_value
}

# Create Nat Gateway
module "nat_gateway_module" {
  source = "../modules/nat_gateway_module"
  region_network_border_group = var.region_value
  # NAT Gateway
  nat_gateway_subnet_id       = module.vpc_module.nhom16_subnet_public_ids[0]
}

# create route table
module "route_table_module" {
  source = "../modules/route_table_module"

  # Route Table
  vpc_id_value = module.vpc_module.nhom16_vpc_id

  # Route Table Private
  destination_cidr_block_private = var.destination_cidr_block_private_value
  gateway_id_private             = module.nat_gateway_module.nhom16_nat_gateway_id
  subnet_id_private              = [module.vpc_module.nhom16_subnet_private_ids[0], 
                                    module.vpc_module.nhom16_subnet_private_ids[1]]

  # Route Table Public
  destination_cidr_block_public  = var.destination_cidr_block_public_value
  gateway_id_public              = module.vpc_module.nhom16_internet_gateway_id
  subnet_id_public               = [module.vpc_module.nhom16_subnet_public_ids[0], 
                                   module.vpc_module.nhom16_subnet_public_ids[1]]
}

# Create Security Groups
module "security_group_module" {
  source = "../modules/security_group_module"
  vpc_id = module.vpc_module.nhom16_vpc_id
  # Security Group Private ingress

  from_port_in_private = var.from_port_in_private_value
  to_port_in_private   = var.to_port_in_private_value
  protocol_in_private  = var.protocol_in_private_value

  # Security Group Public ingress
  ingress_rules_public = var.ingress_rules_public_value

}

# Create S3 bucket
module "s3_module" {
  source = "../modules/s3_module"
  bucket_name_value         = var.s3_bucket_name_value
}

# Create IAM 
module "iam_module" {
  source                             = "../modules/iam_module"
  ec2_role_name                      = var.ec2_role_name_value
  code_deploy_role_name              = var.code_deploy_role_name_value
  readonly_policy_arn                = var.readonly_policy_arn_value
  ec2_code_deploy_policy_arn         = var.ec2_code_deploy_policy_arn_value
  code_deploy_policy_arn             = var.code_deploy_policy_arn_value
  admin_policy_arn                   = var.admin_policy_arn_value
  codebuild_role_name                = var.codebuild_role_name_value
  code_build_dev_access_policy_arn   = var.code_build_dev_access_policy_arn_value
  code_pipeline_role_name            = var.code_pipeline_role_name_value
  code_pipeline_policy_arn_list      = var.code_code_pipeline_policy_arn_list_value  
  # IAM User
  nhom16_user_name                   = var.nhom16_user_name_value
}

# Create CodeCommit repository
module "codeCommit_module" {
  source = "../modules/codeCommit_module"
  repository_name        = var.repository_name_value
  repository_description = var.repository_description_value
}

# Create EC2 instances
module "ec2_instance_module" {
  source                               = "../modules/ec2_module"
  ami_id                               = var.ami_id_value
  instance_type                        = var.instance_type_value
  key_name                             = var.key_name_value
  ec2_instance_profile_name            = module.iam_module.nhom16_instance_profile_name

  # EC2 Public Instance
  subnet_id_public            = module.vpc_module.nhom16_subnet_public_ids[0]
  security_group_id_public    = [module.security_group_module.nhom16_security_group_public_id]
  volume_size                 = var.volume_size_value
  volume_type                 = var.volume_type_value 
  ec2_tag_name                = var.ec2_tag_name_value 
  # eip
  region_network_border_group = var.region_value
}

terraform {
  backend "s3" {
    bucket         = "nhom16-terraform-state-bucket" 
    key            = "create-infrastructure/terraform.tfstate"
    region         = "us-east-1" 
  }
}
