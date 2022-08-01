locals {
  name = "example-complete-role"
  tags = {
    environment        = "examples"
    "user::CostCenter" = "terraform-registry"
  }
  role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "ExampleEC2DesribeAllPolicy"
        Action   = ["ec2:Describe*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
  permissions_boundary_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "ExampleRolePermissionsBoundary"
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
}
