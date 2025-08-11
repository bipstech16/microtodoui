resource "azurerm_container_registry" "microtodoui_dev_eus_01" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}


