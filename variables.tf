variable "region" {
  description = "AWS region"
  default     = "eu-north-1"
  type        = string
}

variable "environment" {
  type = string
}

variable "auth0_app_domain_name" {
  type        = string
  description = "Auth0 tenant app domain"
}

variable "auth0_client_id" {
  type        = string
  description = "Auth0 tenant app client id"
}

variable "auth0_client_secret" {
  type        = string
  description = "Auth0 client secret"
  default = "th87nPX5PE3GytJu0PIcGmZy2marJwqd6-h5CWrOIf2YH8tQmvjgZhW-seyyuFdh"
}

variable "client_callbacks" {
  type        = list(string)
  description = "Client's callback url"
}

variable "client_allowed_origins" {
  type        = list(string)
  description = "Allowed origin for CORS"
}

variable "client_allowed_logout_urls" {
  type        = list(string)
  description = "Client allowed logout URL"
}

variable "client_web_origins" {
  type        = list(string)
  description = "Allowed origin for CORS"
}

variable "email_sender" {
  type        = string
  description = "Authorized sender email address on SES"
}
