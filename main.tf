resource "aws_iam_role" "main" {
  name                  = var.name
  assume_role_policy    = var.assume_role_policy
  description           = var.description
  force_detach_policies = var.force_detach_policies
  max_session_duration  = var.max_session_duration
  name_prefix           = var.name == "" ? var.name_prefix : null
  path                  = var.path
  permissions_boundary  = var.permissions_boundary
  tags                  = merge({ "Name" = var.name }, var.tags)
}

resource "aws_iam_policy" "main" {
  for_each = var.policies
  name     = "${try(each.key, null)}-policy"
  path     = try(each.value.path, "/")
  policy   = each.value.policy
  tags     = try(each.value.tags, {})
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "custom" {
  for_each   = var.policies
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main[each.key].arn
}

resource "aws_iam_role_policy_attachment" "managed" {
  for_each   = toset(var.managed_policy_arns)
  role       = aws_iam_role.main.name
  policy_arn = each.value
}