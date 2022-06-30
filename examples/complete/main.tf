
module "complete_managed_policy" {
  source                = "./../../"
  name                  = "example-complete-role"
  assume_role_policy    = data.aws_iam_policy_document.ec2_assume_role_policy.json
  description           = "Example completerole with a variety of permissions"
  managed_policy_arns   = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
  force_detach_policies = true
  policy_name           = "example-customer-managed-policy"
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
}
