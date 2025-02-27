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

variable "max_session_duration" {
  type        = string
  description = "(Optional) Maximum session duration **(in seconds)** that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours. Since the value is in seconds, please provide a number between 3600 (1 hr) and 43200 (12 hrs)."
  default     = 3600
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

variable "tags" {
  description = "Key-value mapping of tags for the IAM role. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = {}
}

variable "policies" {
  type        = map(any)
  description = "A map of policies to be created."
  default     = {}
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}
