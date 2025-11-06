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
