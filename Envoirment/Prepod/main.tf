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