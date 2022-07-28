# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]


## [1.1.0] - 2022-07-25
### Description
- Removed permissions boundary policy resource to use iam-policy module instead
- Feature: role iam_policy refactored to create multiple policies

## [1.0.4] - 2022-07-04
### Description
- Feature: Option to create a permissions boundary policy when creating a role.
- Added tags argument to policies.

## [1.0.3] - 2022-06-29
### Description
- Fix: Removed redundant code causing changes when doing a second terraform apply in customer-managed policies.
- Modified complete example to also have a customer-managed policy

## [1.0.2] - 2022-06-08
### Description
- Standard files added
- Complete and minimum examples
- Checkov security check fixes

## [1.0.1] - 2022-04-29
### Description
- Fix: Conflict resolution
- Add: example source link update

## [1.0.0] - 2022-03-09
### Description
- Feature: IAM role Policy attachment
- Feature: IAM role Policy
- Feature: IAM Role

[Unreleased]: https://github.com/boldlink/terraform-aws-iam-role/releases/tag/1.1.0...HEAD

[1.1.0]: https://github.com/boldlink/terraform-aws-iam-role/releases/tag/1.1.0

[1.0.4]: https://github.com/boldlink/terraform-aws-iam-role/releases/tag/1.0.4

[1.0.3]: https://github.com/boldlink/terraform-aws-iam-role/releases/tag/1.0.3

[1.0.2]: https://github.com/boldlink/terraform-aws-iam-role/releases/tag/1.0.2

[1.0.1]: https://github.com/boldlink/terraform-aws-iam-role/releases/tag/1.0.1

[1.0.0]: https://github.com/boldlink/terraform-aws-iam-role/releases/tag/1.0.0
