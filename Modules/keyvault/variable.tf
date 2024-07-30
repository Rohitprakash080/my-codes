variable "resource_group_name" {}
variable "location" {}
variable "key_vault_name" {}
variable "secrets" {
  type = map(string)
}