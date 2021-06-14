#
##
#
variable "region" {
  type = string
  default = "East US"
}

variable "sa-name" {
  type = string
}

variable "sa-resource-group" {
  type = string
}

variable "sa-location" {
  type = string
}

variable "sa-account-kind" {
  description = "OPTIONS: BlobStorage, BlockBlobStorage, FileStorage, Storage, StorageV2"
  type = string
}

variable "sa-account-tier" {
  type = string
}

variable "sa-account-replication-type" {
  type = string
}

variable "tags" {
   type = map(string)
   default {}
}

