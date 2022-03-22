provider "aws" {
  region = "eu-west-1"
}

data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "inline_policy" {
  statement {
    actions   = ["ec2:DescribeAccountAttributes"]
    resources = ["*"]
  }
}

locals {
  name        = "boldlink-role-${uuid()}"
  environment = "development"
}

module "role_for_ec2" {
  source                = "./../.."
  name                  = local.name
  environment           = local.environment
  assume_role_policy    = data.aws_iam_policy_document.ec2_assume_role_policy.json
  description           = "EC2 role with variety of permissions"
  managed_policy_arns   = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
  force_detach_policies = true
  inline_policy = [{
    name = "my_inline_policy"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["ec2:Describe*"]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
    },
    {
      name   = "boldlink-policy-10525"
      policy = data.aws_iam_policy_document.inline_policy.json
  }]
}

output "outputs" {
  value = [
    module.role_for_ec2,
  ]
}
