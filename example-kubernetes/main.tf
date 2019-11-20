provider "azurerm" {
    version = "~>1.5"
}

terraform {
    backend "azurerm" {
        storage_account_name    = "terraformstatesafc"
        container_name          = "tfstate"
        key                     = "terraform.test.tfstate"
    }
}