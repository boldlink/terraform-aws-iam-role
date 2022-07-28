output "outputs" {
  description = "Example complete role output"
  value = [
    module.complete_managed_policy.arn,
    module.complete_managed_policy.name,
  ]
}
