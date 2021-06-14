output "sa-name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.sa.name
}

output "sa-resource-group" {
  description = "Storage Account resource group"
  value       = azurerm_storage_account.sa.resource_group_name
}

output "sa-location" {
  description = "Storage Account location"
  value       = azurerm_storage_account.sa.location
}

