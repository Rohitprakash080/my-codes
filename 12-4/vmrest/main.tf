# data "azurerm_subnet" "example" {
#   name                 = "backend"
#   virtual_network_name = "production"
#   resource_group_name  = "networking"
# }

# output "subnet_id" {
#   value = data.azurerm_subnet.example.id
# }








resource "azurerm_network_interface" "nicropra" {
    for_each = var.nicropra
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "ip${each.key}"
    subnet_id                     = data.azurerm_subnet.examplew.id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id = data.azurerm_public_ip.examplef.id
  }
}

resource "azurerm_linux_virtual_machine" "vmropra" {
    for_each = var.nicropra
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nicropra[each.key].id ]
  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb = "30"
    name = "1st-disk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}