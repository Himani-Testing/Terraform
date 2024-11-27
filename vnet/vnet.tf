resource "azurerm_virtual_network" "vaultvnet" {
  for_each            = var.vnetdata
  name                = each.value.vnetname
  location            = each.value.location
  resource_group_name = each.value.rgn
  address_space       = each.value.addspace

  subnet {
    name           = each.value.netname
    address_prefix = each.value.addprefixx

  }
}
