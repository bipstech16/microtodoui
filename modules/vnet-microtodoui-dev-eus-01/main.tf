
resource "azurerm_virtual_network" "microtodoui_dev_eus_01" {
  name                = var.virtual_network_name
  location            = var.virtual_network_location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]


}

