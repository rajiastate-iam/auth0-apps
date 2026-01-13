
variable "display_name" {}
variable "app_type" {}

variable "grant_types" { type = list(string) }
variable "callbacks"   { type = list(string) }

variable "logout_urls" {
  type    = list(string)
  default = []
}

variable "allowed_origins" {
  type    = list(string)
  default = []
}

variable "client_metadata" {
  type    = map(string)
  default = {}
}

variable "jwt_lifetime_in_seconds" {
  type    = number
  default = 3600
}

variable "org_name" {}
variable "servicenow_req" {}

# NEW: two static connection IDs (passed from root locals)
variable "primary_connection_id"   { type = string }
variable "secondary_connection_id" { type = string }
