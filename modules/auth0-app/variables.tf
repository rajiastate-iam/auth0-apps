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



variable "connections" {
  description = "Names of connections to enable for this client."
  type        = set(string)
  default     = []
}

variable "managed_connection_names" {
  description = "All connection names that we manage strictly for this client."
  type        = set(string)
  default     = []
}


variable "org_name" {}
variable "servicenow_req" {}
