variable "gateway_name" {
  description = "The name of the application gateway"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet in which the application gateway is deployed"
  type        = string
}

variable "waf_configuration" {
  description = "WAF configuration for the application gateway"
  type = object({
    enabled        = bool
    firewall_mode  = string
  })
}
