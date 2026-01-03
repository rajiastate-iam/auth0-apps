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
