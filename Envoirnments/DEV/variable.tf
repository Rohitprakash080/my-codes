variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "vnet_address_space" {}
variable "vnet_subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}
variable "key_vault_name" {}
variable "key_vault_secrets" {
  type = map(string)
}
variable "vm_name" {}
variable "vm_admin_username" {}
variable "vm_admin_password" {}
variable "app_gateway_name" {}
variable "waf_configuration" {
  type = object({
    enabled       = bool
    firewall_mode = string
  })
}
