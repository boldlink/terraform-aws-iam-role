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

data "aws_iam_policy_document" "inline_policy" {
  statement {
    sid       = "ExampleInlineEC2DescribePolicy"
    actions   = ["ec2:DescribeAccountAttributes"]
    resources = ["*"]
  }
}
