resource "azurerm_public_ip" "microtodoui_dev_eus_01" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method

}

