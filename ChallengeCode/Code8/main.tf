/* 
 SYMPTOM  : Interview request for 'First Data Bank'
 DATE     : Friday June 4th 2021 @ 15:30 EST
 MANAGER  : Mark Tinderholt
 LINKED-IN: https://www.linkedin.com/in/marktinderholt/
 TOOL     : https://codesandbox.io/s/crazy-night-10how
 CHALLENGE CODE:
     Create an Azure storage account resource
     Create as module
 CODE STATUS: Completed in full in 25 minutes. 
              Extendend time was allows to improve syntax 
 OUTCOME: Job was offered, then four days later Job was cancelled.
*/

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

