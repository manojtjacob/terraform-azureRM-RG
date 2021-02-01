output "redis_cache_id" {
  description = "Redis Cache Id"
  value       = azurerm_redis_cache.this.id
}

module "example" {
  source = "./modules/example"

  ami = aws_ami_copy.example
}
