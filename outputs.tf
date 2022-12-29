output "policy_arn" {
  description = "The ARN of the managed policy."
  value = aws_iam_policy.assumable_roles_policy.arn
}
