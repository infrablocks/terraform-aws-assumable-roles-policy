variable "policy_name" {
  description = "The name of the policy to create."
  type = string
}

variable "policy_description" {
  description = "The description of the policy to create."
  type = string
}

variable "assumable_roles" {
  description = "A list of role ARNs corresponding to roles that should be assumable under this policy."
  type = list(string)
  default = []
}
