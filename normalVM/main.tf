resource "azurerm_resource_group" "rgropra" {
  name     = "exam"
  location = "South India"
}

resource "azurerm_virtual_network" "vnetropra" {
    depends_on = [ azurerm_resource_group.rgropra ]
  name                = "ex-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rgropra.location
  resource_group_name = azurerm_resource_group.rgropra.name
}

resource "azurerm_subnet" "subnetropra" {
    depends_on = [ azurerm_virtual_network.vnetropra ]
  name                 = "inte-sub1"
  resource_group_name  = azurerm_resource_group.rgropra.name
  virtual_network_name = azurerm_virtual_network.vnetropra.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_public_ip" "pip1" {
  name                = "TestPublicIp1"
  resource_group_name = azurerm_resource_group.rgropra.name
  location            = azurerm_resource_group.rgropra.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nicropra" {
  name                = "example-nic"
  location            = azurerm_resource_group.rgropra.location
  resource_group_name = azurerm_resource_group.rgropra.name

  ip_configuration {
    name                          = "ip1"
    subnet_id                     = azurerm_subnet.subnetropra.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip1.id
  }
}

resource "azurerm_linux_virtual_machine" "vmropra" {
  name                = "1st-machine"
  resource_group_name = azurerm_resource_group.rgropra.name
  location            = azurerm_resource_group.rgropra.location
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  admin_password = "dhodala@0007"
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nicropra.id ]
  

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