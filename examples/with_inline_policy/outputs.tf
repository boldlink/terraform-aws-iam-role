
output "outputs" {
  description = "Example role with inline policy"
  value = [
    module.inline_policy.arn,
    module.inline_policy.name,
  ]
}
