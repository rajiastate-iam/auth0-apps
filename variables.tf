######################################################
# Provider variables
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
# App specs supplied by the workflow (PR-driven)
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
    connections           = optional(list(string), [])
  }))
  default = []
}
