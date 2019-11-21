variable "policy_name" {
  type = string
  description = "The name of the policy to create."
}

variable "policy_description" {
  type = string
  description = "The description of the policy to create."
}

variable "assumable_roles" {
  type = list(string)
  default = []
  description = "A list of role ARNs corresponding to roles that should be assumable under this policy."
}
