resource "aws_iam_role" "main" {
  name                  = var.name
  assume_role_policy    = var.assume_role_policy
  description           = var.description
  force_detach_policies = var.force_detach_policies
  managed_policy_arns   = compact(concat(var.managed_policy_arns, [try(aws_iam_policy.main[0].arn, "")]))
  max_session_duration  = var.max_session_duration
  name_prefix           = var.name == null ? var.name_prefix : null
  path                  = var.path
  permissions_boundary  = var.permissions_boundary
  dynamic "inline_policy" {
    for_each = var.inline_policy

    content {
      name   = lookup(inline_policy.value, "name")
      policy = lookup(inline_policy.value, "policy")
    }
  }
  tags = var.tags
}

resource "aws_iam_policy" "main" {
  count       = var.policy != null ? 1 : 0
  name        = var.policy_name
  path        = var.path
  description = var.policy_description
  policy      = var.policy
}

resource "aws_iam_role_policy_attachment" "main" {
  count      = var.policy != null ? 1 : 0
  role       = aws_iam_role.main.name
  policy_arn = join("", aws_iam_policy.main.*.arn)
}
