data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

locals {
  tags = merge(var.rediscache_additional_tags, data.azurerm_resource_group.this.tags)
}

#Redis Cache
resource "azurerm_redis_cache" "this" {
  name                = lookup(var.redis_cache, "redis_cache_name")
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  capacity            = lookup(var.redis_cache, "capacity")
  family              = lookup(var.redis_cache, "family")
  sku_name            = lookup(var.redis_cache, "sku_name")
  enable_non_ssl_port = lookup(var.redis_cache, "enable_non_ssl_port")
  minimum_tls_version = lookup(var.redis_cache, "minimum_tls_version")
  tags                = local.tags
}
