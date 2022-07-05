
module "complete_managed_policy" {
  source                           = "./../../"
  name                             = "example-complete-role"
  assume_role_policy               = data.aws_iam_policy_document.ec2_assume_role_policy.json
  description                      = "Example completerole with a variety of permissions"
  managed_policy_arns              = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
  force_detach_policies            = true
  policy_name                      = "Example-customer-managed-policy"
  permissions_boundary_policy_name = "Example-permission-boundary"
  permissions_boundary_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceTypeOfferings",
          "ec2:DescribeVpcs",
          "ec2:DescribeInstanceTypes",
          "ec2:DescribeSubnets",
          "ec2:DescribeInstanceStatus"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
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
