terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.39.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "15a5294d-bf43-4301-914e-3af5e2295b0b"
}