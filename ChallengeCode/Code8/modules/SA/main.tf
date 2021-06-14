resource "azurerm_storage_account" "sa" {
   name                     = var.sa-name
   resource_group_name      = var.sa-resource-group
   location                 = var.sa-location
   account_kind             = var.sa-account-kind
   account_tier             = var.sa-account-tier
   account_replication_type = var.sa-account-replication-type 
   tags                     = var.tags

}

