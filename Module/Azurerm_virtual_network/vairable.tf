variable "vnet" {
  type = map(object({
    name                           = string
    resource_group_name            = string
    location                       = string
    address_space                  = optional(list(string))
    dns_servers                    = optional(list(string))
    private_endpoint_vnet_policies = optional(string)
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), [])
  }))
}
