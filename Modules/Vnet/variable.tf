variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "address_space" {}
variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}