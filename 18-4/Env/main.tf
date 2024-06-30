module "rggg" {
    source = "../directories/RG"
  rggg=var.rggg
}
module "vnett" {
    depends_on = [ module.rggg ]
  source = "../directories/Vnet"
  vnett=var.vnett
}
module "subnet" {
    depends_on = [ module.rggg,module.vnett ]
    source="../directories/subnet"
    subnet=var.subnet
  
}
module "vms" {
  source = "../directories/vmrest"
  vms=var.vms
  
}

module "pip1" {
  
  source = "../directories/pip"
  pip1 = var.pip1
}

module "bastion" {
  source = "../directories/bastion"
  bastion = var.bastion
  depends_on = [ module.pip1 ]
}
module "sqldb" {
  source="../directories/sql"
  sqldb = var.sqldb
  
}

module "keyvault" {
  source = "../directories/keyvault"
  keyvault = var.keyvault
}