locals {
  policy_hash = { for k, v in var.policies : k => substr(md5(v.policy), 0, 8) }
}
