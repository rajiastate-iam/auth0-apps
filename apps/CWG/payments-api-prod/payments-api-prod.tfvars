display_name = "CWG-payments-api-prod"
app_type     = "regular_web"

callbacks = [
  "https://payments.cwg.example.com/callback"
]

logout_urls = [
  "https://payments.cwg.example.com/logout"
]

allowed_origins = [
  "https://payments.cwg.example.com"
]

grant_types = [
  "authorization_code"
]

client_metadata = {
  system      = "payments"
  owner_team  = "cwg-payments-team"
  environment = "prod"
}

jwt_lifetime_in_seconds = 3600

org_name       = "CWG"
servicenow_req = "REQ0098765"
