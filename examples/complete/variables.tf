variable "path" {
  type        = string
  description = "(Optional) Path to the role"
  default     = "/examples/"
}

variable "description" {
  type        = string
  description = "(Optional) Description of the role."
  default     = "Example complete role with a variety of permissions"
}

variable "force_detach_policies" {
  type        = bool
  description = "(Optional) Whether to force detaching any policies the role has before destroying it. Defaults to `false`"
  default     = true
}

variable "managed_policy_arns" {
  type        = list(string)
  description = "(Optional) Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., `managed_policy_arns = [])` will cause Terraform to remove all managed policy attachments."
  default     = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
}

variable "boundary_policy_description" {
  type        = string
  description = "(Optional, Forces new resource) Description of the IAM permissions boundary policy."
  default     = "Example permission boundary"
}
