
terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.37.0"
    }
  }
}

# Existing client
resource "auth0_client" "app" {
  name        = var.display_name
  description = "Org: ${var.org_name} | SNOW: ${var.servicenow_req}"

  app_type            = var.app_type
  grant_types         = var.grant_types
  callbacks           = var.callbacks
  web_origins         = var.allowed_origins
  allowed_logout_urls = var.logout_urls

  client_metadata = merge(
    {
      org_name       = var.org_name
      servicenow_req = var.servicenow_req
    },
    var.client_metadata
  )

  jwt_configuration {
    lifetime_in_seconds = var.jwt_lifetime_in_seconds
  }

  is_first_party = true
}

# Lookup each managed connection by its name (no hard-coded IDs)
data "auth0_connection" "managed" {
  for_each = var.managed_connection_names
  name     = each.key
}

# Strictly control whether this client is enabled on each managed connection
# If a connection is listed in var.connections -> enable the client
# Else -> ensure client NOT enabled on that connection (empty set)
resource "auth0_connection_clients" "managed" {
  for_each     = data.auth0_connection.managed

  connection_id  = each.value.id
  enabled_clients = contains(var.connections, each.key) ? [auth0_client.app.id] : []
}

