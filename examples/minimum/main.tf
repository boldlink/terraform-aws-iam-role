module "minimum" {
  source             = "./../../"
  name               = "terraform-aws-iam-role-minimum"
  assume_role_policy = local.policy
}
