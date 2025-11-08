resource_group = {
  rg1 = {
    name       = "rg-prepod-001"
    location   = "central india"
    managed_by = "terraform"
    tags = {
      envoirment = "prepod"
      applcation = "todoapp"
    }
  }
  rg2 = {
    name     = "rg-prepod-002"
    location = "central india"
  }
}
storage_account = {
  stg1 = {
    name                     = "osstorage001os"
    resource_group_name      = "rg-prepod-001"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  stg2 = {
    name                             = "osstorage002os"
    resource_group_name              = "rg-prepod-002"
    location                         = "central india"
    account_tier                     = "Standard"
    account_replication_type         = "GRS"
    account_kind                     = "StorageV2"
    cross_tenant_replication_enabled = false
    access_tier                      = "Cool"
    https_traffic_only_enabled       = true
    min_tls_version                  = "TLS1_0"

  }
}
container = {
  cont1 = {
    name                              = "container1"
    storage_account_name              = "osstorage001os"
    resource_group_name               = "rg-prepod-001"
    container_access_type             = "private"
    encryption_scope_override_enabled = "true"

  }
  cont2 = {
    name                 = "container1"
    storage_account_name = "osstorage002os"
    resource_group_name  = "rg-prepod-002"
  }
}
vnet = {
  vnet1 = {
    name                = "vnet-prepod-001"
    resource_group_name = "rg-prepod-001"
    location            = "central india"
    address_space       = ["10.0.0.0/16"]
    # # list of object vairable with ternary operator
    # subnets = [
    #   {
    #     name             = "subnet-prepod-001"
    #     address_prefixes = ["10.0.10.0/24"]
    #   },
    #   {
    #     name             = "subnet-prepod-002"
    #     address_prefixes = ["10.0.20.0/24"]
    # }]

    # map of object vairable without ternary operator
    subnets = {
      sub1 = {
        name             = "subnet-prepod-001"
        address_prefixes = ["10.0.10.0/24"]
      }
      sub2 = {
        name             = "subnet-prepod-002"
        address_prefixes = ["10.0.20.0/24"]
      }
    }
  }

  vnet2 = {
    name                           = "vnet-prepod-002"
    resource_group_name            = "rg-prepod-002"
    location                       = "central india"
    address_space                  = ["10.0.0.0/16"]
    private_endpoint_vnet_policies = "Disabled"
  }
}

pip = {
  pip1 = {
    name                 = "pip-prepod-001"
    location             = "central india"
    resource_group_name  = "rg-prepod-001"
    allocation_method    = "Static"
    ddos_protection_mode = "Disabled"
  }

  pip3 = {
    name                = "pip-prepod-003"
    location            = "central india"
    resource_group_name = "rg-prepod-002"
    allocation_method   = "Static"
  }
}

nic = {
  nic1 = {
    nic_name             = "nic-prepod-001"
    subnet_name          = "subnet-prepod-001"
    virtual_network_name = "vnet-prepod-001"
    location             = "central india"
    resource_group_name  = "rg-prepod-001"
    pip_name             = "pip-prepod-001"
    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
  nic2 = {
    nic_name             = "nic-prepod-002"
    subnet_name          = "subnet-prepod-002"
    virtual_network_name = "vnet-prepod-001"
    location             = "central india"
    resource_group_name  = "rg-prepod-001"
    pip_name             = "pip-prepod-001"
    ip_configurations = {
      ip1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
}



