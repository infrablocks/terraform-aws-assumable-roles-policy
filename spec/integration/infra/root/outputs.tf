output "policy_arn" {
  value = module.assumable_roles_policy.policy_arn
}

output "target_role_arn" {
  value = aws_iam_role.target_role.arn
}
