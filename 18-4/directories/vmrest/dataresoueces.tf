data "azurerm_subnet" "examplew" {
    for_each = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
  
}