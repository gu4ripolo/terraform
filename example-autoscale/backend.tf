terraform {
    backend "azurerm" {
        storage_account_name    = "terraformstatesafc"
        container_name          = "tfstate"
        key                     = "terraform.dev.tfstate"
    }
}