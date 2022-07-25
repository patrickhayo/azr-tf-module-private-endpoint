resource "azurerm_resource_group" "this" {
  name     = uuid()
  location = "westeurope"
}

module "key_vault_private_endpoint" {
  source                         = "./modules"
  name                           = "MyKeyVault_PrivateEndpoint"
  location                       = azurerm_resource_group.this.location
  resource_group_name            = azurerm_resource_group.this.name
  subnet_id                      = "MySubnetId"
  private_connection_resource_id = "MyKeyValutResourceToConnectId"
  is_manual_connection           = false
  subresource_name               = "vault"
  private_dns_zone_group_name    = "KeyVaultPrivateDnsZoneGroup"
  private_dns_zone_group_ids     = "myPrivateDNSZoneGroupId"
}
