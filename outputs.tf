
# Map of "<org>/<app>-<env>" => client_id (from module output)
output "client_ids" {
  description = "Map: <org>/<app>-<env> => client_id"
  value       = { for k, m in module.auth0_app : k => m.client_id }
}

# Optional: map of names if needed
output "client_names" {
  value = { for k, m in module.auth0_app : k => m.name }
}

# Provide the allowed connection IDs as an output so the workflow can consume them.
output "allowed_connection_ids" {
  description = "The two connection IDs that must be enabled on each app"
  value       = [local.primary_connection_id, local.secondary_connection_id]
}
