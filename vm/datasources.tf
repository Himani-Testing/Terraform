data "azurerm_subnet" "subnet1" {
  name                 = "vvsubnet"
  resource_group_name  = "human"
  virtual_network_name = "vvnet1"

}