terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-devops-eus-01"
    storage_account_name = "satfstateeus01"
    container_name       = "tfstate"
    key                  = "prod.tfstate"
  }
}
