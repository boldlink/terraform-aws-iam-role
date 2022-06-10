module "minimum" {
  source             = "./../../"
  name               = "example-minimum-role"
  assume_role_policy = local.policy
}
