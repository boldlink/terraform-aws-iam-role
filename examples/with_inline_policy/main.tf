module "inline_policy" {
  source             = "./../../"
  name               = "example-inline-policy-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
  description        = "EC2 role with variety of permissions"
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
      name   = "boldlink-policy-10525"
      policy = data.aws_iam_policy_document.inline_policy.json
  }]
}
