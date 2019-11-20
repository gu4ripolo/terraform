resource "azurerm_resource_group" "vmss" {
    name        = "${var.resource_group_name}"
    location    = "${var.location}"
    tags        = "${var.tags}"
}

resource "random_string" "fqdn" {
    length  = 6
    special = false
    upper   = false
    number  = false
}

resource "azurerm_virtual_network" "vmss" {
    name                = "vmss-net"
    address_space       = ["200.0.0.0/16"]
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.vmss.name}"
    tags                = "${var.tags}"
}

resource "azurerm_subnet" "vmss" {
    name = "vmss-subnet"
    resource_group_name     = "${azurerm_resource_group.vmss.name}"
    virtual_network_name    = "${azurerm_virtual_network.vmss.name}"
    address_prefix          = "200.0.1.0/24"
}

resource "azurerm_public_ip" "vmss" {
    name                = "vmss-public-ip"
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.vmss.name}"
    allocation_method   = "Static"
    domain_name_label   = "${random_string.fqdn.result}"
    tags                = "${var.tags}"
}

