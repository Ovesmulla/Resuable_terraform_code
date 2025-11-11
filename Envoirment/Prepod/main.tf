module "resource_group" {
  source         = "../../Module/Azurerm_resourece_group"
  resource_group = var.resource_group
}

module "storage_account" {
  depends_on      = [module.resource_group]
  source          = "../../Module/Azurerm_storage_account"
  storage_account = var.storage_account
}

module "container" {
  depends_on = [module.storage_account]
  source     = "../../Module/Azurerm_container"
  container  = var.container
}

module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../Module/Azurerm_virtual_network"
  vnet       = var.vnet
}
module "pip" {
  depends_on = [var.resource_group]
  source     = "../../Module/Azurerm_public_ip"
  pip        = var.pip
}

module "nic" {
  depends_on = [module.vnet]
  source     = "../../Module/Azurerm_networl_interface"
  nic        = var.nic
}

module "nsg" {
  depends_on = [ module.resource_group ]
  source = "../../Module/Azurerm_network_security_group"
  nsg = var.nsg
}