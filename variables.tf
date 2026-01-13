
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
  description = "Auth0 Management API client ID"
}

variable "auth0_client_secret" {
  type        = string
  sensitive   = true
  description = "Auth0 Management API client secret"
}

######################################################
# App specs provided by workflow (from PR YAMLs)
######################################################
variable "apps" {
  description = "List of Auth0 app specs to apply in this run."
  type = list(object({
    orgname              = string
    app                  = string
    env                  = string
    displayname          = string
    apptype              = string
    granttypes           = optional(list(string), [])
    callbacks            = optional(list(string), [])
    logouturls           = optional(list(string), [])
    allowedorigins       = optional(list(string), [])
    clientmetadata       = optional(map(string), {})
    jwtlifetimeinseconds = optional(number, 3600)
    servicenow_req       = optional(string)
 
  }))
  default = []
}
