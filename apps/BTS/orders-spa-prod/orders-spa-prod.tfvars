##############################################
# Required App Identity
##############################################
display_name = "BTS-orders-spa-prod"
app_type     = "spa"

##############################################
# URLs
##############################################
callbacks = [
  "https://orders.bts.example.com/callback"
]

logout_urls = [
  "https://orders.bts.example.com/logout"
]

allowed_origins = [
  "https://orders.bts.example.com"
]

##############################################
# Grant Types
##############################################
grant_types = [
  "authorization_code",
  "refresh_token"
]

##############################################
# Metadata
##############################################
client_metadata = {
  system       = "orders"
  owner_team   = "orders-platform"
  environment  = "prod"
}

##############################################
# JWT Defaults (IAM Controlled)
##############################################
jwt_lifetime_in_seconds = 3600

##############################################
# Org + Compliance
##############################################
org_name       = "BTS"
servicenow_req = "REQ0012345"
