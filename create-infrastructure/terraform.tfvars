region_value  = "us-east-1"

# VPC
vpc_cidr_block_value         = "172.16.0.0/16"
vpc_cidr_block_private_value = ["172.16.1.0/24", "172.16.2.0/24"]
vpc_cidr_block_public_value  = ["172.16.3.0/24", "172.16.4.0/24"]
vpc_subnet_count_value = 2

#route table
destination_cidr_block_private_value = "0.0.0.0/0"
destination_cidr_block_public_value  = "0.0.0.0/0"

#security group private
from_port_in_private_value = 22
to_port_in_private_value   = 22
protocol_in_private_value  = "tcp"

#security group public
ingress_rules_public_value = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access from anywhere"
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP access from anywhere"
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS access from anywhere"
  },
  {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Access to port 3000 from anywhere for Client - frontend"
  },
  {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Access to port 5000 from anywhere for Server - backend"
  }
]

# S3 bucket
s3_bucket_name_value = "nhom16-app-student-bucket-22521190"

# IAM
ec2_role_name_value = "nhom16_ec2_role"
code_deploy_role_name_value = "nhom16_codeDeploy_role"
nhom16_user_name_value = "nhom16_user"
readonly_policy_arn_value = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
ec2_code_deploy_policy_arn_value = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
code_deploy_policy_arn_value = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
admin_policy_arn_value = "arn:aws:iam::aws:policy/AdministratorAccess"
codebuild_role_name_value = "nhom16_codeBuild_role"
code_build_dev_access_policy_arn_value = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
code_pipeline_role_name_value = "nhom16_codePipeline_role"
code_code_pipeline_policy_arn_list_value = [
  "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess",
  "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess",
  "arn:aws:iam::aws:policy/AWSCodeDeployFullAccess", 
]
# CodeCommit repository
repository_name_value        = "nhom16-app-student-repo"
repository_description_value = "Repository for Nhom16 App Student"

# EC2 instance
ami_id_value = "ami-0f9de6e2d2f067fca" # ubuntu 22.04 ami
instance_type_value = "t3.medium" # t3.medium instance type
key_name_value = "nhom16" # my key pair name
volume_size_value = 20
volume_type_value = "gp2" # General Purpose SSD (gp2) volume type
ec2_tag_name_value = "nhom16_ec2_public"