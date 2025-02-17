
module "complete_managed_policy" {
  source                = "./../../" # Adjust path accordingly
  name                  = local.name
  assume_role_policy    = data.aws_iam_policy_document.ec2_assume_role_policy.json
  description           = var.description
  force_detach_policies = var.force_detach_policies
  max_session_duration  = var.max_session_duration
  path                  = var.path
  tags                  = merge(local.tags, { "Name" = local.name })
  permissions_boundary  = module.boundary_policy.policy_arn
  managed_policy_arns   = var.managed_policy_arns # e.g., [ "arn:aws:iam::aws:policy/AmazonS3FullAccess" ]
  policies = {
    "${local.name}-policy" = {
      policy = local.role_policy
      tags   = local.tags
    }
  }
}

module "boundary_policy" {
  source      = "boldlink/iam-policy/aws"
  version     = "1.1.0"
  policy_name = "${local.name}-permissions-boundary"
  description = var.boundary_policy_description
  policy      = local.permissions_boundary_policy
  tags        = merge(local.tags, { "Name" = "${local.name}-permissions-boundary" })
}
