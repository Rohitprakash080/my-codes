data "azurerm_subnet" "examplew" {
  name                 = "inte-sub1"
  virtual_network_name = "vnetsu"
  resource_group_name  = "su"
  
}
data "azurerm_public_ip" "examplef" {
  name                = "TestPublicIp1"
  resource_group_name = "su"
}