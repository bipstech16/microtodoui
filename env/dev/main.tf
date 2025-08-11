module "resource_group" {
  source      = "../../modules/rg-microtodoui-dev-eus-01"
  rg_name     = "rg-microtodoui-dev-eus-01"
  rg_location = "Central India"
}

module "virtual_network" {
  depends_on               = [module.resource_group]
  source                   = "../../modules/vnet-microtodoui-dev-eus-01"
  resource_group_name      = "rg-microtodoui-dev-eus-01"
  virtual_network_name     = "vnet-microtodoui-dev-eus-01"
  virtual_network_location = "Central India"
}

module "snet" {
  depends_on           = [module.resource_group, module.virtual_network]
  source               = "../../modules/snet-app-microtodoui-dev-eus-01"
  resource_group_name  = "rg-microtodoui-dev-eus-01"
  virtual_network_name = "vnet-microtodoui-dev-eus-01"
  subnet_name          = "snet-app-microtodoui-dev-eus-01"
}

module "nsg" {
  depends_on          = [module.resource_group, module.virtual_network, module.snet]
  source              = "../../modules/nsg-microtodoui-dev-eus-01"
  nsg_name            = "nsg-microtodoui-dev-eus-01"
  resource_group_name = "rg-microtodoui-dev-eus-01"
  nsg_location        = "Central India"
}


module "pip" {
  depends_on          = [module.resource_group, module.virtual_network, module.snet, module.nsg]
  source              = "../../modules/pip-bastion-microtodoui-dev-eus-01"
  pip_name            = "pip-bastion-microtodoui-dev-eus-01"
  resource_group_name = "rg-microtodoui-dev-eus-01"
  location            = "Central India"
  allocation_method   = "Static"
}

module "nic" {
  depends_on          = [module.resource_group, module.virtual_network, module.snet, module.pip]
  source              = "../../modules/nic-vm1-microtodoui-dev-eus-01"
  nic_name            = "nic-vm1-microtodoui-dev-eus-01"
  resource_group_name = "rg-microtodoui-dev-eus-01"
  location            = "Central India"
  subnet_id           = module.snet.subnet_id
  public_ip_id        = module.pip.id
}


module "vm" {
  source              = "../../modules/vm-web-microtodoui-dev-eus-01"
  name                = "vm-microtodoui"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  nic_id              = module.nic.id
  vm_size             = "Standard_B2ms"
  admin_username      = "azureuser"
  admin_password      = "YourStrongP@ssw0rd!"

}

module "aks" {
  depends_on          = [module.resource_group]
  source              = "../../modules/aks-microtodoui-dev-eus-01"

}

module "acr" {
    depends_on = [ module.resource_group,module.aks ]
  source              = "../../modules/acrmicrotodouidev01"
  name                = "acrmicrotodouidev01"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}


module "sql_server" {
  depends_on = [ module.resource_group ]
  source              = "../../modules/sql-microtodoui-dev-eus-01"
  name                = "sql-microtodoui-dev-eus-0110"
  location            = "Central India"
  resource_group_name = module.resource_group.name
  admin_username      = "sqladmin"
  admin_password      = "ChangeThisPassword123!"
}