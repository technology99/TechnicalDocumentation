#
## Azure Resource Group Variables
#
variable "region" {
  type = string
  default = "East US"
}

variable "rg-name" {
  type = string
}

variable "rg-location" {
  type = string
  default = var.region
}

variable "rg-tags" {
   type = map(string)
   default {}
}
