data "aws_iam_policy_document" "target_role_assume_role_policy" {
  statement {
    principals {
      identifiers = [
        data.aws_caller_identity.current.arn
      ]
      type = "AWS"
    }

    actions = [
      "sts:AssumeRole"
    ]

    effect = "Allow"
  }
}

resource "aws_iam_role" "target_role" {
  name = "target-role-${var.deployment_identifier}"
  assume_role_policy = data.aws_iam_policy_document.target_role_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "target_role" {
  role = aws_iam_role.target_role.name
  policy_arn = module.assumable_roles_policy.policy_arn
}

module "assumable_roles_policy" {
  source = "../../"

  policy_name = var.policy_name
  policy_description = var.policy_description
  assumable_roles = [
    aws_iam_role.assumable_role_1.arn,
    aws_iam_role.assumable_role_2.arn,
    aws_iam_role.assumable_role_3.arn,
  ]
}
