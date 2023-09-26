[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-iam-role/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-iam-role.svg)](https://github.com/boldlink/terraform-aws-iam-role/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-iam-role/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-iam-role/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-iam-role/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-iam-role/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-iam-role/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-iam-role/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-iam-role/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-iam-role/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-iam-role/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-iam-role/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-iam-role/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-iam-role/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-iam-role/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-iam-role/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-iam-role/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-iam-role/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform IAM Role module example of complete and most common configuration


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.15.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.23.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_boundary_policy"></a> [boundary\_policy](#module\_boundary\_policy) | boldlink/iam-policy/aws | 1.0.2 |
| <a name="module_complete_managed_policy"></a> [complete\_managed\_policy](#module\_complete\_managed\_policy) | ./../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.ec2_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_boundary_policy_description"></a> [boundary\_policy\_description](#input\_boundary\_policy\_description) | (Optional, Forces new resource) Description of the IAM permissions boundary policy. | `string` | `"Example permission boundary"` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) Description of the role. | `string` | `"Example complete role with a variety of permissions"` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | (Optional) Whether to force detaching any policies the role has before destroying it. Defaults to `false` | `bool` | `true` | no |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | (Optional) Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., `managed_policy_arns = [])` will cause Terraform to remove all managed policy attachments. | `list(string)` | <pre>[<br>  "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"<br>]</pre> | no |
| <a name="input_path"></a> [path](#input\_path) | (Optional) Path to the role | `string` | `"/examples/"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_outputs"></a> [outputs](#output\_outputs) | Example complete role output |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

#### BOLDLink-SIG 2022
