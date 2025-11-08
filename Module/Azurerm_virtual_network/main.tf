resource "azurerm_virtual_network" "vnet" {
  for_each                       = var.vnet
  name                           = each.value.name
  resource_group_name            = each.value.resource_group_name
  location                       = each.value.location
  address_space                  = each.value.address_space
  dns_servers                    = each.value.dns_servers
  private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies

  # list of object vairable with ternary operator
  # dynamic "subnet" {
  #   for_each = each.value.subnets == null ? [] : each.value.subnets
  #   content {
  #     name             = subnet.value.name
  #     address_prefixes = subnet.value.address_prefixes
  #   }
  # }
  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }

}
