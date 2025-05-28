# create role for EC2 instances
resource "aws_iam_role" "nhom16_ec2_role" {
    name = var.ec2_role_name
    description = "Role for EC2 instances to access S3 and code Deploy"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                "Effect": "Allow",
                "Action": [
                    "sts:AssumeRole"
                ],
                "Principal": {
                    "Service": [
                        "ec2.amazonaws.com"
                    ]
                }
            }
        ]
    })
}
  
# create role for code deploy
resource "aws_iam_policy_attachment" "ec2_role_policy_attachment_s3_readonly" {
    name       = "ec2_role_policy_attachment_s3_readonly"
    roles      = [aws_iam_role.nhom16_ec2_role.name]
    policy_arn = var.readonly_policy_arn
}

resource "aws_iam_policy_attachment" "ec2_role_policy_attachment_codedeploy" {
    name       = "ec2_role_policy_attachment_codedeploy"
    roles      = [aws_iam_role.nhom16_ec2_role.name]
    policy_arn = var.ec2_code_deploy_policy_arn
}

resource "aws_iam_instance_profile" "nhom16_instance_profile" {
  name = "nhom16_ec2_instance_profile"
  role = aws_iam_role.nhom16_ec2_role.name
}

resource "aws_iam_role" "nhom16_codeDeploy_role" {
    name = var.code_deploy_role_name
    description = "Role for CodeDeploy"
    assume_role_policy = jsonencode({
        "Version": "2012-10-17",
    "Statement": [
            {
                "Sid": "",
                "Effect": "Allow",
                "Principal": {
                    "Service": [
                        "codedeploy.amazonaws.com"
                    ]
                },
                "Action": [
                    "sts:AssumeRole"
                ]
            }
        ]
    })
  
}

resource "aws_iam_policy_attachment" "codeDeploy_role_policy_attachment_codedeploy" {
    name       = "codeDeploy_role_policy_attachment_codedeploy"
    roles      = [aws_iam_role.nhom16_codeDeploy_role.name]
    policy_arn = var.code_deploy_policy_arn
}

# create a user
resource "aws_iam_user" "nhom16_user" {
    name = var.nhom16_user_name
}
resource "aws_iam_user_policy_attachment" "nhom16_user_policy_attachment_admin" {
    user       = aws_iam_user.nhom16_user.name
    policy_arn = var.admin_policy_arn
}

# create role for code build
resource "aws_iam_role" "nhom16_codeBuild_role" {
    name = var.codebuild_role_name
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                "Effect": "Allow",
                "Action": [
                    "sts:AssumeRole"
                ],
                "Principal": {
                    "Service": [
                        "codebuild.amazonaws.com"
                    ]
                }
            }
        ]
    })
}
resource "aws_iam_role_policy_attachment" "nhom16_codeBuild_role_policy_attachment" {
    role       = aws_iam_role.nhom16_codeBuild_role.name
    policy_arn = var.code_build_dev_access_policy_arn
}

resource "aws_iam_role_policy" "codebuild_cloudwatch_policy" {
  name = "CodeBuildCloudWatchPolicy"
  role = aws_iam_role.nhom16_codeBuild_role.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = [
          "*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy" "codebuild_S3_policy" {
  name = "CodeBuildS3Policy"
  role = aws_iam_role.nhom16_codeBuild_role.name
  policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Action = [
                    "s3:GetObject",
                    "s3:GetObjectVersion",
                    "s3:PutObject"
                ],
                Resource = "*"
                    
            },
            {
                Effect = "Allow"
                Action = [
                    "s3:ListBucket"
                ]
                Resource = "*"
            }
        ]
    })
}

# codepipeline role
resource "aws_iam_role" "nhom16_codePipeline_role" {
    name = var.code_pipeline_role_name
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow",
                Action = [
                    "sts:AssumeRole"
                ],
                Principal = {
                    Service = [
                        "codepipeline.amazonaws.com"
                    ]
                }
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "nhom16_codePipeline_role_policy_attachment" {
    role       = aws_iam_role.nhom16_codePipeline_role.name
    for_each   = toset(var.code_pipeline_policy_arn_list)
    policy_arn = each.value
}