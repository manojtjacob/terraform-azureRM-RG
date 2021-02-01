output "redis_cache_id" {
  description = "Redis Cache Id"
  value       = azurerm_redis_cache.this.id
}

module "consul" {
  version = "0.0.5"
}
