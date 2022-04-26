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

data "aws_iam_policy_document" "ec2_policy" {
  statement {
    actions   = ["ec2:DescribeAccountAttributes"]
    resources = ["*"]
  }
}

locals {
  name        = "boldlink-role"
  environment = "development"
  policy_name = "Account-Attributes-policy"
}

module "role_for_ec2" {
  source                = "boldlink/iam-role/aws"
  name                  = local.name
  create_policy         = true
  environment           = local.environment
  assume_role_policy    = data.aws_iam_policy_document.ec2_assume_role_policy.json
  description           = "EC2 role with variety of permissions"
  force_detach_policies = true
  policy_name           = local.policy_name
  policy                = data.aws_iam_policy_document.ec2_policy.json
}

output "outputs" {
  value = [
    module.role_for_ec2,
  ]
}
