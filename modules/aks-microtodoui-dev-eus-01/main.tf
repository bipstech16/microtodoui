resource "azurerm_kubernetes_cluster" "microtodoui_dev_eus_01" {
  name                = "aks-microtodoui-dev-eus-01"
  location            = "Central India"
  resource_group_name = "rg-microtodoui-dev-eus-01"

  dns_prefix = "aks-microtodoui-dev-eus-01-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}