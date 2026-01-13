
locals {
  apps_by_key = {
    for a in var.apps :
    format("%s/%s-%s", a.orgname, a.app, lower(a.env)) => {
      orgname     = a.orgname
      app         = a.app
      env         = lower(a.env)
      displayname = a.displayname
      apptype     = a.apptype
      granttypes  = try(a.granttypes, [])
      callbacks   = try(a.callbacks, [])
      logouturls  = try(a.logouturls, [])
      origins     = try(a.allowedorigins, [])
      metadata    = try(a.clientmetadata, {})
      jwt_ttl     = try(a.jwtlifetimeinseconds, 3600)
      snow_req    = try(a.servicenow_req, null)
    }
  }
}

module "auth0_app" {
  source   = "./modules/auth0-app"
  for_each = local.apps_by_key

  display_name            = each.value.displayname
  app_type                = each.value.apptype
  callbacks               = each.value.callbacks
  logout_urls             = each.value.logouturls
  allowed_origins         = each.value.origins
  grant_types             = each.value.granttypes
  client_metadata         = each.value.metadata
  jwt_lifetime_in_seconds = each.value.jwt_ttl

  org_name       = each.value.orgname
  servicenow_req = each.value.snow_req

  # Static connection IDs for this tenant
  primary_connection_id   = local.primary_connection_id
  secondary_connection_id = local.secondary_connection_id
}
