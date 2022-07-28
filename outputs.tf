output "arn" {
  value       = aws_iam_role.main.arn
  description = "Amazon Resource Name (ARN) specifying the role."
}

output "create_date" {
  value       = aws_iam_role.main.create_date
  description = "Creation date of the IAM role."
}

output "id" {
  value       = aws_iam_role.main.id
  description = "Name of the role."
}

output "name" {
  value       = aws_iam_role.main.name
  description = "Name of the role."
}

output "tags_all" {
  value       = aws_iam_role.main.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider `default_tags`"
}

output "unique_id" {
  value       = aws_iam_role.main.unique_id
  description = "Stable and unique string identifying the role."
}

output "policy_arns" {
  value       = [for policy in aws_iam_policy.main : policy.arn]
  description = "The ARN(s) assigned by AWS to this policy/policies."
}

output "policy_descriptions" {
  value       = [for policy in aws_iam_policy.main : policy.description]
  description = "The description(s) of the policy/ policies."
}

output "policy_names" {
  value       = [for policy in aws_iam_policy.main : policy.name]
  description = "The name(s) of the policy."
}

output "policy_paths" {
  value       = [for policy in aws_iam_policy.main : policy.path]
  description = "The path(s) of the policy/policies in IAM."
}

output "policy_ids" {
  value       = [for policy in aws_iam_policy.main : policy.policy_id]
  description = "The policy's ID(s)."
}

output "policy_tags_all" {
  value       = [for policy in aws_iam_policy.main : policy.tags_all]
  description = "A map of tags assigned to the resource(s), including those inherited from the provider `default_tags`"
}
