# Azure Static website with CDN Endpoint Terraform Module

Terraform Module to create an Azure storage account and enable the static website also creates optional CDN service for the static website.

To change the storage account kind, set the argument `account_kind` to the appropriate value. By default, account kind set to `StorageV2`.  If the storage account kind set to other types, this module automatically computes the appropriate values for `account_tier` and `account_replication_type` arguments. The valid options are `BlobStorage`, `BlockBlobStorage`, `FileStorage`, `Storage` and `StorageV2`.

> Note: *Static Website can only be created when the `account_kind` is set to `StorageV2`.*

These types of resources are supported

* [Storage Account](https://www.terraform.io/docs/providers/azurerm/r/storage_account.html)
* [Static Website](https://www.terraform.io/docs/providers/azurerm/r/storage_account.html#static_website)
* [Content Delivery Network (CDN)](https://www.terraform.io/docs/providers/azurerm/r/cdn_endpoint.html)
* [Custom domain with an Azure CDN endpoint](https://docs.microsoft.com/en-us/azure/cdn/cdn-map-content-to-custom-domain)

## Module Usage

```hcl
module "static-website-cdn" {
  source  = "kumarvna/static-website-cdn/azurerm"
  version = "2.2.0"

  # Resource Group, location, and Storage account details
  create_resource_group = true
  resource_group_name   = "rg-demo-westeurope-01"
  location              = "westeurope"
  storage_account_name  = "storageaccwesteupore01"

  # Static Website createion set to true by default
  # account_kind should set to StorageV2 or BlockBlobStorage
  static_website_source_folder = var.static_website_source_folder
  index_path                   = var.index_path
  custom_404_path              = var.custom_404_path

  # CDN endpoint for satic website
  enable_cdn_profile = true
  cdn_profile_name   = var.cdn_profile_name
  cdn_sku_profile    = var.cdn_sku_profile

  # Custom domain for CDN endpoint
  custom_domain_name = "web.example.com"
  friendly_name      = "mywebapp"
  
  # Adding TAG's to your Azure resources (Required)
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Owner       = "test-user"
  }
}
```

## Create resource group

By default, this module will not create a resource group and the name of an existing resource group to be given in an argument `resource_group_name`. If you want to create a new resource group, set the argument `create_resource_group = true`.