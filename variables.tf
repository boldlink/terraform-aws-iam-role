# IAM Role
variable "assume_role_policy" {
  type        = string
  description = "(Required) Policy that grants an entity permission to assume the role."
}

variable "description" {
  type        = string
  description = "(Optional) Description of the role."
  default     = null
}

variable "force_detach_policies" {
  type        = bool
  description = "(Optional) Whether to force detaching any policies the role has before destroying it. Defaults to `false`"
  default     = false
}

variable "managed_policy_arns" {
  type        = list(string)
  description = "(Optional) Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., `managed_policy_arns = [])` will cause Terraform to remove all managed policy attachments."
  default     = []
}

variable "max_session_duration" {
  type        = string
  description = "(Optional) Maximum session duration **(in seconds)** that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours. Since the value is in seconds, please provide a number between 3600 (1 hr) and 43200 (12 hrs)."
  default     = null
}

variable "name" {
  type        = string
  description = "(Optional, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name"
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "(Optional, Forces new resource) Creates a unique friendly name beginning with the specified prefix. Conflicts with `name`"
  default     = null
}

variable "path" {
  type        = string
  description = "(Optional) Path to the role"
  default     = "/"
}

variable "permissions_boundary" {
  type        = string
  description = "(Optional) ARN of the policy that is used to set the permissions boundary for the role."
  default     = null
}

variable "inline_policy" {
  description = "(Optional) Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. Defined below. If no blocks are configured, Terraform will ignore any inline policies in this resource. Configuring one empty block (i.e., inline_policy {}) will cause Terraform to remove all inline policies."
  type        = list(map(string))
  default     = []
}

variable "tags" {
  description = "Key-value mapping of tags for the IAM role. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = {}
}

# IAM Policy
variable "policy_name" {
  type        = string
  description = "(Optional, Forces new resource) The name of the policy. If omitted, Terraform will assign a random, unique name."
  default     = null
}

variable "policy_description" {
  type        = string
  description = "(Optional, Forces new resource) Description of the IAM policy."
  default     = null
}

variable "policy" {
  type        = string
  description = "(Required) The inline policy document. This is a JSON formatted string."
  default     = null
}
