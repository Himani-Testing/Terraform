resource "azurerm_network_interface" "uatnic"{
    for_each = var.hivms
    name = each.value.inetname
    location = each.value.location
    resource_group_name =  each.value.rgname


ip_configuration {
    name = each.value.ipname
    subnet_id = data.azurerm_subnet.subnet1.id
    private_ip_address_allocation = each.value.addallocation

}
}

resource "azurerm_linux_virtual_machine" "hivm" {
    for_each = var.hivms
  name = each.value.vmname
  location = each.value.location
  resource_group_name = each.value.rgn
  size = each.value.size
  admin_username = var.username
  admin_password = var.password
  network_interface_ids = [azurerm_network_interface.uatnic[each.key].id]
disable_password_authentication = false

os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}