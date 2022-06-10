
module "complete_managed_policy" {
  source                = "./../../"
  name                  = "example-complete-role"
  assume_role_policy    = data.aws_iam_policy_document.ec2_assume_role_policy.json
  description           = "EC2 role with variety of permissions"
  managed_policy_arns   = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
  force_detach_policies = true
  inline_policy = [{
    name = "example_inline_policy"
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
      name   = "example_inline_policy2"
      policy = data.aws_iam_policy_document.inline_policy.json
  }]
}
