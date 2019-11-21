data "aws_iam_policy_document" "assumable_roles_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect = "Allow"
    resources = var.assumable_roles
  }
}

resource "aws_iam_policy" "assumable_roles_policy" {
  name = var.policy_name
  description = var.policy_description
  policy = data.aws_iam_policy_document.assumable_roles_policy.json
}
