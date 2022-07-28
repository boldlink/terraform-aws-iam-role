
module "complete_managed_policy" {
  source                = "./../../"
  name                  = local.name
  assume_role_policy    = data.aws_iam_policy_document.ec2_assume_role_policy.json
  description           = "Example complete role with a variety of permissions"
  managed_policy_arns   = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
  force_detach_policies = true
  tags                  = local.tags
  permissions_boundary  = module.boundary_policy.policy_arn
  policies = {
    "${local.name}-policy" = {
      policy = local.role_policy
      tags   = local.tags
    }
  }
}

module "boundary_policy" {
  source      = "boldlink/iam-policy/aws"
  version     = "1.0.2"
  policy_name = "${local.name}-permissions-boundary"
  description = "Example-permission-boundary"
  policy      = local.permissions_boundary_policy
}
