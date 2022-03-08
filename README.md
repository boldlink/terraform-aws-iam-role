# AWS IAM Role Terraform module

## Description
This module creates an AWS IAM Role together with a policy  defining the permissions that can be attached to the role using a policy attachment resource.

Example available [here](https://github.com/boldlink/terraform-aws-iam-role/tree/main/examples)

## Documentation

[AWS Identity and Access Management Documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)

[Terraform provider documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.4.0 |

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
| <a name="input_environment"></a> [environment](#input\_environment) | The environment in which this resource is deployed | `string` | `null` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | (Optional) Whether to force detaching any policies the role has before destroying it. Defaults to `false` | `bool` | `false` | no |
| <a name="input_inline_policy"></a> [inline\_policy](#input\_inline\_policy) | (Optional) Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. Defined below. If no blocks are configured, Terraform will ignore any inline policies in this resource. Configuring one empty block (i.e., inline\_policy {}) will cause Terraform to remove all inline policies. | `list(map(string))` | `[]` | no |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | (Optional) Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., `managed_policy_arns = [])` will cause Terraform to remove all managed policy attachments. | `list(string)` | `[]` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | (Optional) Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Optional, Forces new resource) Friendly name of the role. If omitted, Terraform will assign a random, unique name | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | (Optional, Forces new resource) Creates a unique friendly name beginning with the specified prefix. Conflicts with `name` | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | (Optional) Path to the role | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | (Optional) ARN of the policy that is used to set the permissions boundary for the role. | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | (Required) The inline policy document. This is a JSON formatted string. | `string` | n/a | yes |
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | (Optional, Forces new resource) Description of the IAM policy. | `string` | `null` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | (Optional, Forces new resource) The name of the policy. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) specifying the role. |
| <a name="output_aws_assigned_policy_id"></a> [aws\_assigned\_policy\_id](#output\_aws\_assigned\_policy\_id) | The ARN assigned by AWS to this policy. |
| <a name="output_create_date"></a> [create\_date](#output\_create\_date) | Creation date of the IAM role. |
| <a name="output_id"></a> [id](#output\_id) | Name of the role. |
| <a name="output_name"></a> [name](#output\_name) | Name of the role. |
| <a name="output_policy"></a> [policy](#output\_policy) | The policy document. |
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | The ARN assigned by AWS to this policy. |
| <a name="output_policy_description"></a> [policy\_description](#output\_policy\_description) | The description of the policy. |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | The policy's ID. |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | The name of the policy. |
| <a name="output_policy_path"></a> [policy\_path](#output\_policy\_path) | The path of the policy in IAM. |
| <a name="output_policy_tags_all"></a> [policy\_tags\_all](#output\_policy\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider `default_tags` |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider `default_tags` |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | Stable and unique string identifying the role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
