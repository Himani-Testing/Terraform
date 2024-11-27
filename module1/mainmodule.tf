module "virtualnetwork" {
  source   = "../vnet"
  vnetdata = var.vnetdata
}

module "virtualmachine" {
  depends_on = [module.virtualnetwork]
  source     = "../vm"
  hivms      = var.hivms
  uatnic1    = var.uatnic1
  username   = var.username
  password   = var.password

}





