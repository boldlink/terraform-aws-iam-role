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

output "aws_assigned_policy_id" {
  value       = join("", aws_iam_policy.main.*.id)
  description = "The ARN assigned by AWS to this policy."
}

output "policy_arn" {
  value       = join("", aws_iam_policy.main.*.arn)
  description = "The ARN assigned by AWS to this policy."
}

output "policy_description" {
  value       = [aws_iam_policy.main.*.description]
  description = "The description of the policy."
}

output "policy_name" {
  value       = join("", aws_iam_policy.main.*.name)
  description = "The name of the policy."
}

output "policy_path" {
  value       = join("", aws_iam_policy.main.*.path)
  description = "The path of the policy in IAM."
}

output "policy" {
  value       = join("", aws_iam_policy.main.*.policy)
  description = "The policy document."
}

output "policy_id" {
  value       = join("", aws_iam_policy.main.*.policy_id)
  description = "The policy's ID."
}

output "policy_tags_all" {
  value       = [aws_iam_policy.main.*.tags_all]
  description = "A map of tags assigned to the resource, including those inherited from the provider `default_tags`"
}
