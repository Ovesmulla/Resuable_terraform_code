data "azurerm_subnet" "subnetid" {
  for_each             = var.nsg
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}


data "azurerm_public_ip" "pipid" {
  for_each            = var.nsg
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
