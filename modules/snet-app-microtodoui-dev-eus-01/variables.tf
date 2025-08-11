
variable "subnet_name" {
    default = "snet-app-microtodoui-dev-eus-01"
    type = string
    description = "Name of the Azure Subnet for application resources"
  
}

variable "resource_group_name" {
    default = "rg-microtodoui-dev-eus-01"
    type = string
    description = "Name of the Azure Subnet for application resources"
  
}

variable "virtual_network_name" {
    default = "vnet-microtodoui-dev-eus-01"
    type = string
    description = "Azure region where resources will be deployed"
  
}

