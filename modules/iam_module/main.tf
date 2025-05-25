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
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_policy_attachment" "ec2_role_policy_attachment_codedeploy" {
    name       = "ec2_role_policy_attachment_codedeploy"
    roles      = [aws_iam_role.nhom16_ec2_role.name]
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
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
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

# create a user
resource "aws_iam_user" "nhom16_user" {
    name = var.nhom16_user_name
}