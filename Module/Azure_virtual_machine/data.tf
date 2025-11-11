data "azurerm_public_ip" "pipid" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "keyid" {
  for_each            = var.vms
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "admin_name" {
  for_each     = var.vms
  name         = each.value.secret_name
  key_vault_id = data.azurerm_key_vault.keyid[each.key].id
}

data "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.vms
  name         = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.keyid[each.key].id
}

data "azurerm_network_interface" "nic_ids" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
