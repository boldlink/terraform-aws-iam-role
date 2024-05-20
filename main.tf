resource "aws_iam_role" "main" {
  name                  = var.name
  assume_role_policy    = var.assume_role_policy
  description           = var.description
  force_detach_policies = var.force_detach_policies
  managed_policy_arns   = concat(var.managed_policy_arns, [for policy in aws_iam_policy.main : policy.arn])
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
  tags = merge(
    {
      "Name" : var.name
    },
  var.tags)
}

resource "aws_iam_policy" "main" {
  for_each = var.policies
  name     = "${try(each.key, null)}-${local.policy_hash[each.key]}"
  path     = try(each.value.path, "/")
  policy   = each.value.policy
  tags     = try(each.value.tags, {})
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "main" {
  for_each   = var.policies
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main[each.key].arn
}
