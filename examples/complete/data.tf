data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    sid     = "ExampleSTSAssumeRole"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
