module "Resource_group" {
  source         = "../../Module/Azurerm_resourece_group"
  resource_group = var.resource_group
}
module "Storage_Account" {
  depends_on      = [module.Resource_group]
  source          = "../../Module/Azurerm_storage_account"
  storage_account = var.storage_account
}
module "Container" {
  depends_on = [module.Storage_Account]
  source     = "../../Module/Azurerm_container"
  container  = var.container
}
module "Virtual_Network" {
  depends_on = [module.Resource_group]
  source     = "../../Module/Azurerm_virtual_network"
  vnet       = var.vnet
}
module "Public_Ip" {
  depends_on = [module.Resource_group]
  source     = "../../Module/Azurerm_public_ip"
  pip        = var.pip
}
module "Network_Interface_Card" {
  depends_on = [module.Resource_group]
  source     = "../../Module/Azurerm_networl_interface"
  nic        = var.nic
}
module "Netwok_security_group" {
  depends_on = [module.Resource_group]
  source     = "../../Module/Azurerm_network_security_group"
  nsg        = var.nsg
}
module "Key_Vault" {
  depends_on = [module.Resource_group]
  source     = "../../Module/Azure_keyvault"
  kv         = var.kv
}
module "Key_Secrets" {
  depends_on = [module.Key_Vault]
  source     = "../../Module/Azure_key_secrets"
  secrets    = var.secrets
}
module "Virtual_Machine" {
  depends_on = [module.Key_Vault,module.Network_Interface_Card]
  source     = "../../Module/Azure_virtual_machine"
  vms         = var.vms
}
