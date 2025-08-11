variable "virtual_network_name" {
default = "vnet-microtodoui-dev-eus-01"
type = string
description = "Name of the Azure Virtual Network"
}

variable "virtual_network_location" {
default = "Central India"
type = string
description = "Azure region where resources will be deployed"
}

variable "resource_group_name" {
default = "rg-microtodoui-dev-eus-01"
type = string
description = "Name of the Azure Resource Group"
}