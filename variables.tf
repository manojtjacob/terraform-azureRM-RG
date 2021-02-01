variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Redis Cache"
}

variable "rediscache_additional_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

# Redis Cache
variable "redis_cache" {
  type = object({
    redis_cache_name    = string       # (Required) Specifies the name of the Redis Cache resource.
    capacity            = number       # (Required) The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4.
    family              = string       # (Required) The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium)
    sku_name            = string       # (Required) The SKU of Redis to use. Possible values are Basic, Standard and Premium.
    enable_non_ssl_port = bool         # (Optional) Enable the non-SSL port (6379) - disabled by default.
    minimum_tls_version = string       # (Optional) The minimum TLS version. Defaults to 1.0.
    #shard_count         = number       # (Optional) Only available when using the Premium SKU The number of Shards to create on the Redis Cluster.
    #subnet_id           = string       # (Optional) Only available when using the Premium SKU The ID of the Subnet within which the Redis Cache should be deployed. This Subnet must only contain Azure Cache for Redis instances without any other type of resources.
    #zones               = list(string) # (Optional) A list of a single item of the Availability Zone which the Redis Cache should be allocated in.
    #redis_configuration = map(string)  # (Optional) Redis_configuration
  })
  description = "Map that holds the Redis Cache configuration"
  default     = null
}
