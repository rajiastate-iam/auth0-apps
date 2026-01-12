
######################################################
# Provider variables (keep your existing ones)
######################################################
variable "auth0_domain" {
  type        = string
  description = "Auth0 tenant domain"
}

variable "auth0_client_id" {
  type        = string
  sensitive   = true
  description = "Auth0 management API client ID"
}

variable "auth0_client_secret" {
  type        = string
  sensitive   = true
  description = "Auth0 management API client secret"
}

######################################################
# NEW: App specs provided by workflow (from PR)
######################################################
variable "apps" {
  description = "List of Auth0 app specifications to apply in this run."
  type = list(object({
    orgname               = string
    app                   = string
    env                   = string
    displayname           = string
    apptype               = string
    granttypes            = optional(list(string), [])
    callbacks             = optional(list(string), [])
    logouturls            = optional(list(string), [])
    allowedorigins        = optional(list(string), [])
    clientmetadata        = optional(map(string), {})
    jwtlifetimeinseconds  = optional(number, 3600)
    servicenow_req        = optional(string)
    connections           = optional(list(string), []) # e.g., ["CustomersDB","azure-ad-prod"]
  }))
  default = []
}

######################################################
# NEW: Strict management list (names of all connections
# we will enforce ON/OFF for this client)
######################################################
variable "managed_connection_names" {
  description = "All connection names to enforce enable/disable for the client."
  type        = set(string)
  default     = []
}
