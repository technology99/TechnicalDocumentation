#
##
#

module "resource-group" {
   source      = "./modules/RG"
   rg-name     = var.rg-name
   rg-location = var.rg-location
   rg-tags     = var.rg-tags
}          

module "storage-account" {
   source = "./modules/SA"
   sa-name                     = var.sa-name
   sa-resource-group-name      = var.resource-group-name
   sa-location                 = var.resource-group-location
   sa-account-kind             = var.sa-account-kind
   sa-account-tier             = var.sa-account-tier
   sa-account-replication-type = var.sa-account-replication-type
   sa-tags                     = var.sa-tags 

# References:
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

