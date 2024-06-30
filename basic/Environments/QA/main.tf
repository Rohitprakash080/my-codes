module "rg" {
    source= "../../child_Modules/RG"
    rg_list=var.rg_map
  
}

module "vne" {
 source="../../child_Modules/Vnet"
 vnet=var.vnet 
}