data "azurerm_client_config" "current" {}

module "vnet" {
  source              = "../../Modules/Vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space
  subnets             = var.vnet_subnets
}

module "keyvault" {
  source              = "../../Modules/keyvault"
  resource_group_name = var.resource_group_name
  location            = var.location
  key_vault_name      = var.key_vault_name
  secrets             = var.key_vault_secrets
}

module "vm" {
  source              = "../../Modules/vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_name             = var.vm_name
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password
  vnet_subnet_id      = module.vnet.vnet_id
}

module "app_gateway" {
  source              = "../../Modules/applicationgateway"
  resource_group_name = var.resource_group_name
  location            = var.location
  gateway_name        = var.app_gateway_name
  vnet_subnet_id      = module.vnet.vnet_id
  waf_configuration = var.waf_configuration
}