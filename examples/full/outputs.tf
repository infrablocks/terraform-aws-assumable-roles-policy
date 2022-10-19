output "policy_arn" {
  value = module.assumable_roles_policy.policy_arn
}

output "target_role_arn" {
  value = aws_iam_role.target_role.arn
}

output "assumable_role_1_arn" {
  value = aws_iam_role.assumable_role_1.arn
}

output "assumable_role_2_arn" {
  value = aws_iam_role.assumable_role_2.arn
}

output "assumable_role_3_arn" {
  value = aws_iam_role.assumable_role_3.arn
}
