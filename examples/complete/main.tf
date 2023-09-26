
module "complete_managed_policy" {
  source                = "./../../"
  name                  = local.name
  assume_role_policy    = data.aws_iam_policy_document.ec2_assume_role_policy.json
  description           = var.description
  managed_policy_arns   = var.managed_policy_arns
  force_detach_policies = var.force_detach_policies
  path                  = var.path
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
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source      = "boldlink/iam-policy/aws"
  version     = "1.0.2"
  policy_name = "${local.name}-permissions-boundary"
  description = var.boundary_policy_description
  policy      = local.permissions_boundary_policy
}
