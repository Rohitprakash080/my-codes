# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West Europe"
# }

# resource "azurerm_virtual_network" "example" {
#   name                = "examplevnet"
#   address_space       = ["192.168.1.0/24"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_subnet" "example" {
#   name                 = 
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["192.168.1.224/27"]
# }

# resource "azurerm_public_ip" "example" {
#   name                = "examplepip"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }
resource "azurerm_public_ip" "example" {
  for_each = var.bastion

  name                = "example-public-ip-${each.key}"
  location            = data.azurerm_resource_group.exa1[each.key].location
  resource_group_name = data.azurerm_resource_group.exa1[each.key].name
  allocation_method   = "Static"
  sku                 = "Standard"  # Specify the Standard SKU
}

resource "azurerm_bastion_host" "example" {
    for_each = var.bastion
  name                = "roexamplebastion-${each.key}"
  location            = data.azurerm_resource_group.exa1[each.key].location
  resource_group_name = data.azurerm_resource_group.exa1[each.key].name

  ip_configuration {
    name                 = "configuration1"
    subnet_id            = data.azurerm_subnet.exa3[each.key].id
    public_ip_address_id = azurerm_public_ip.example[each.key].id
  }
}