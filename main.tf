# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
  subscription_id = "b2d63878-776c-4e91-8789-cf0c7ace6e60"
  tenant_id = "fedfd771-b82e-47b1-a705-959f02fe7ded"
}

resource "azurerm_resource_group" "rg" {
  name     = "pavan_terraform_rg"
  location = "australiaeast"
}
