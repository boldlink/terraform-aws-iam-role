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

# AWS IAM Role Terraform module

## Description
This module creates an AWS IAM Role together with a policy  defining the permissions that can be attached to the role using a policy attachment resource.


## Why Use This Module Over Standard Resources
When managing AWS Identity and Access Management (IAM) roles within your infrastructure as code (IAC) setup, you have several options, including manually defining IAM roles and policies or using Terraform's built-in AWS provider resources. However, the `boldlink/iam-role/aws` Terraform module offers distinct advantages over these standard approaches, making it a compelling choice for your IAM role management needs.

- Simplified IAM Role Creation

Creating IAM roles with the `boldlink/iam-role/aws` module is straightforward and concise. You can define IAM roles and associated policies in a clear and structured manner using Terraform. This module abstracts many of the low-level AWS IAM API details, saving you time and effort in writing and maintaining IAM configurations.

- Version Compatibility and Consistency

The module ensures compatibility with specific Terraform and AWS provider versions, reducing the risk of compatibility issues and ensuring a smooth deployment process. This version alignment minimizes the need for manual adjustments, providing a consistent IAM role management experience.

- Policy Management Flexibility

With this module, you have the flexibility to manage IAM role policies using various methods, including inline policies and managed policy attachments. You can easily specify custom policies to meet your specific security and access control requirements.

- Documentation and Examples

The module is well-documented, providing clear guidance on how to use it effectively. Additionally, a set of examples is available in the repository, demonstrating real-world use cases and helping you get started quickly.

Examples available [here](https://github.com/boldlink/terraform-aws-iam-role/tree/main/examples)

## Usage
*NOTE*: These examples use the latest version of this module

```hcl
module "minimum" {
  source             = "boldlink/iam-role/aws"
  version            = "<insert_latest_version_here>"
  assume_role_policy = local.policy
}
```

*locals.tf* file
```hcl
locals {
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
```
## Documentation

[AWS Identity and Access Management Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)

[Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.15.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | (Required) Policy that grants an entity permission to assume the role. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | (Optional) Description of the role. | `string` | `null` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | (Optional) Whether to force detaching any policies the role has before destroying it. Defaults to `false` | `bool` | `false` | no |
| <a name="input_inline_policy"></a> [inline\_policy](#input\_inline\_policy) | (Optional) Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. Defined below. If no blocks are configured, Terraform will ignore any inline policies in this resource. Configuring one empty block (i.e., inline\_policy {}) will cause Terraform to remove all inline policies. | `list(map(string))` | `[]` | no |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | (Optional) Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., `managed_policy_arns = [])` will cause Terraform to remove all managed policy attachments. | `list(string)` | `[]` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | (Optional) Maximum session duration **(in seconds)** that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours. Since the value is in seconds, please provide a number between 3600 (1 hr) and 43200 (12 hrs). | `string` | `7200` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional, Forces new resource) Creates a unique friendly name beginning with the specified prefix. Conflicts with `name` | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | (Optional) Path to the role | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | (Optional) ARN of the policy that is used to set the permissions boundary for the role. | `string` | `null` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | A map of policies to be created. | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value mapping of tags for the IAM role. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) specifying the role. |
| <a name="output_create_date"></a> [create\_date](#output\_create\_date) | Creation date of the IAM role. |
| <a name="output_id"></a> [id](#output\_id) | Name of the role. |
| <a name="output_name"></a> [name](#output\_name) | Name of the role. |
| <a name="output_policy_arns"></a> [policy\_arns](#output\_policy\_arns) | The ARN(s) assigned by AWS to this policy/policies. |
| <a name="output_policy_descriptions"></a> [policy\_descriptions](#output\_policy\_descriptions) | The description(s) of the policy/ policies. |
| <a name="output_policy_ids"></a> [policy\_ids](#output\_policy\_ids) | The policy's ID(s). |
| <a name="output_policy_names"></a> [policy\_names](#output\_policy\_names) | The name(s) of the policy/policies. |
| <a name="output_policy_paths"></a> [policy\_paths](#output\_policy\_paths) | The path(s) of the policy/policies in IAM. |
| <a name="output_policy_tags_all"></a> [policy\_tags\_all](#output\_policy\_tags\_all) | A map of tags assigned to the resource(s), including those inherited from the provider `default_tags` |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider `default_tags` |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | Stable and unique string identifying the role. |
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

### Makefile
The makefile contained in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests:
`$ make tests`
* Clean all tests:
`$ make clean`

#### BOLDLink-SIG 2023
