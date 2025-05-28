# VPC
variable "region_value" {
  description = "The AWS region to deploy resources in."
  type        = string
}


variable "vpc_cidr_block_value" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_cidr_block_private_value" {
  description = "The CIDR block for the private subnet."
  type        = list(string)
}

variable "vpc_cidr_block_public_value" {
  description = "The CIDR block for the public subnet."
  type        = list(string)
}

variable "vpc_subnet_count_value" {
  description = "The number of subnets to create."
  type        = number
  
}
#route table

variable "destination_cidr_block_private_value" {
  description = "The destination CIDR block for the private route."
  type        = string
}

variable "destination_cidr_block_public_value" {
  description = "The destination CIDR block for the public route."
  type        = string
}


# variables for security group
variable "from_port_in_private_value" {
  description = "The starting port for ingress rules in the private security group."
  type        = number
}

variable "to_port_in_private_value" {
  description = "The ending port for ingress rules in the private security group."
  type        = number
}

variable "protocol_in_private_value" {
  description = "The protocol for ingress rules in the private security group."
  type        = string
}


variable "ingress_rules_public_value" {
  description = "List of ingress rules for the public security group."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string, "")
  }))
  default = []
  
}

# variables for s3 bucket
variable "s3_bucket_name_value" {
  description = "The name of the S3 bucket to create."
  type        = string
  
}

# IAM
variable "ec2_role_name_value" {
  description = "Name of the IAM role for EC2 instances"
  type        = string
}

variable "code_deploy_role_name_value" {
  description = "Name of the IAM role for CodeDeploy"
  type        = string
}

variable "nhom16_user_name_value" {
  description = "Name of the IAM user"
  type        = string
}

# variables for codeCommit repository
variable "repository_name_value" {
  description = "Name of the CodeCommit repository"
  type        = string
}
variable "repository_description_value" {
  description = "Description of the CodeCommit repository"
  type        = string
}

variable "readonly_policy_arn_value" {
  description = "ARN of the read-only policy for S3"
  type        = string
}
variable "ec2_code_deploy_policy_arn_value" {
  description = "ARN of the CodeDeploy policy for EC2 instances"
  type        = string
}
variable "code_deploy_policy_arn_value" {
  description = "ARN of the CodeDeploy policy for CodeDeploy role"
  type        = string
}

variable "admin_policy_arn_value" {
  description = "ARN of the admin policy for IAM user"
  type        = string
}
variable "codebuild_role_name_value" {
  description = "Name of the IAM role for CodeBuild"
  type        = string
}
variable "code_build_dev_access_policy_arn_value" {
  description = "ARN of the CodeBuild developer access policy"
  type        = string
}

# variables for ec2 instance
variable "ami_id_value" {
  type        = string
  description = "AMI ID cho EC2 instance (Amazon Linux 2, Ubuntu v.v)"
}

variable "key_name_value" {
  type        = string
  description = "The name of the SSH key used to log in to EC2 instances."
}

variable "instance_type_value" {
  description = "EC2 instance type"
  type        = string
}

variable "volume_size_value" {
  description = "Size of the root volume in GB"
  type        = number
}
variable "volume_type_value" {
  description = "Type of the root volume"
  type        = string
}

variable "ec2_tag_name_value" {
  description = "Tag name for the EC2 instance"
  type        = string 
}


# variables for codePipeline
variable "code_pipeline_role_name_value" {
  description = "Name of the IAM role for CodePipeline"
  type        = string
  
}

variable "code_code_pipeline_policy_arn_list_value" {
  description = "List of ARNs for the CodePipeline policies"
  type        = list(string)
}