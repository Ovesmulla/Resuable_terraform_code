variable "nic" {
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    pip_name             = optional(string)
    ip_configurations = optional(map(object({
      name                          = string
      private_ip_address_allocation = string
    })))
  }))
}
