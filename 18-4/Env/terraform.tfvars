rggg = {
rg1={
    name="roh1"
    location="japan west"
}
rg2={
    name="roh2"
    location="japan west"
}

}
vnett = {
    vnett1={
        name                = "vnet_1"
  address_space       = ["10.0.0.0/16"]
  location            = "japanwest"
  resource_group_name = "roh1"
    }
     vnett2={
        name                = "vnet_2"
  address_space       = ["10.0.0.0/16"]
  location            = "japanwest"
  resource_group_name = "roh2"
    }
}
subnet = {
  subnet1={
    name                 = "front-sub"
  resource_group_name  = "roh1"
  virtual_network_name = "vnet_1"
  address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2={
    name                 = "back-sub"
  resource_group_name  = "roh2"
  virtual_network_name = "vnet_2"
  address_prefixes     = ["10.0.2.0/24"]
  }
  subnet4={
    name                 = "bia-sub"
  resource_group_name  = "roh2"
  virtual_network_name = "vnet_2"
  address_prefixes     = ["10.0.3.0/24"]
  }
   subnet3={
    name                 = "data-sub"
  resource_group_name  = "roh2"
  virtual_network_name = "vnet_2"
  address_prefixes     = ["10.0.4.0/24"]
  }
   subnet5={
    name                 = "AzureBastionSubnet"
  resource_group_name  = "roh2"
  virtual_network_name = "vnet_2"
  address_prefixes     = ["10.0.5.0/24"]
  }
}
vms = {
  vm1={
  nic_name                = "nic1"
  vm_name              = "fVm1-ro"
  location            = "japanwest"
  resource_group_name = "roh1"
  private_ip_address_allocation ="Dynamic"
  size                = "standard_DS2_V2"
  admin_username      = "asdminuser1"
  admin_password      ="dhodala@0007"
  subnet_name = "front-sub"
  vnet_name = "vnet_1"
}
vm2={
  nic_name                = "nic2"
  vm_name              = "bVm2-ro"
  location            = "japanwest"
  resource_group_name = "roh2"
  private_ip_address_allocation ="Dynamic"
  size                = "standard_DS2_V2"
  admin_username      = "asdminuser2"
  admin_password      ="dhodala@0009"
  subnet_name = "back-sub"
  vnet_name = "vnet_2"
}
}
pip1 = {
  # pip01={
  #   name                = "TestPublicIp1"
  # resource_group_name = "roh2"
  # location            = "japanwest"
  # allocation_method   = "Static"
  # sku="standard"
  
  pip02={
    name                = "TestPublicIp2"
  resource_group_name = "roh2"
  location            = "japanwest"
  allocation_method   = "Static"
  sku="standard"
  }
}
bastion = {
  b1= {
    rg_name= "roh2"
    vnet_name="vnet_2"
    subnet_name="AzureBastionSubnet"
    pip_name= "TestPublicIp2"
    
  }
}
sqldb = {
  Sql1={
    sqlserver_name = "rohisqlserver"
    server_version= "12.0"
    administrator_login          = "roadminuser"
  administrator_login_password = "dhodala@0009"
  environment = "Devlopment"
storage_ac_name="rohstorag1"
account_tier             = "Standard"
  account_replication_type = "LRS"
  sql_db_name="rohsqldb1"
  
  }
}
keyvault={
    key1={
      
        rg_name="roh2"
        soft_delete_retention_days  = 90
  purge_protection_enabled = false
  enabled_for_disk_encryption = true
  name                        = "rohaexamplekeyvault"
  sku_name = "standard"
    }
}