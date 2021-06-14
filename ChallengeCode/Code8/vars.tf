##
#  Global Variables
##

variable "region" {
  type = string
  default = "East US"
}

##
#  AzureRM Resource Group Variables
##

variable "rg-name" {
  type = string
  default = "my-rg-name"
}

variable "rg-location" {
  type = string
  default = var.region
}


variable "rg-tags" {
   type = map(string)
   default {
     group = "sandbox"
}

##
#  AzureRM Storage Account Variables
##

variable "sa-name" {
  type = string
  default = "my-sa-name"
}

variable "sa-resource-group" {
  type = string
  default = "azure_resource_group.my-sa-name.name"
}

variable "sa-location" {
  type = string
  default = "azure_resource_group.my-sa-name.location"
}

variable "sa-account-kind" {
  description = "OPTIONS: BlobStorage, BlockBlobStorage, FileStorage, Storage, StorageV2"
  type = string
  default = "StorageV2"
}

variable "sa-account-tier" {
  type = string
  default = "Standard"
}

variable "sa-account-replication-type" {
  type = string
  default = "GRS"
}

variable "sa-tags" {
   type = map(string)
   default {
     environment = "sandbox"
  }
}
