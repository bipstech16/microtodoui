variable "rg_name" {
default = "rg-microtodoui-dev-eus-01"
type = string
description = "Name of the Azure Resource Group"
}

variable "rg_location" {
default = "East US"
type = string
description = "Azure region where resources will be deployed"
}