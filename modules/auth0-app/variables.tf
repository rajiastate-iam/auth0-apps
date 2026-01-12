variable "display_name" {}
variable "app_type" {}

variable "grant_types" {
  type = list(string)
}

variable "callbacks" {
  type = list(string)
}

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

# Names of connections to enable for this client (from YAML)
variable "connections" {
  type    = set(string)
  default = []
}

# Managed connection names (the set we control strictly via Terraform)
# You can keep this as exactly the two you mentioned, or widen later.
variable "managed_connection_names" {
  type    = set(string)
  default = ["CustomersDB", "azure-ad-prod"]
}

variable "org_name" {}
variable "servicenow_req" {}
