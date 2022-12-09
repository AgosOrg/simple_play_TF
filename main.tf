terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "0.40.0"
    }
  }
}

provider "auth0" {
  # A client need to be   created manually for Terraform and linked to access Management API
  domain        = var.auth0_app_domain_name
  client_id     = var.auth0_client_id
  client_secret = var.auth0_client_secret
}

resource "auth0_resource_server" "main_api" {
  name        = "Core Auth API (managed by Terraform)"
  identifier  = "core-auth-api"
  signing_alg = "RS256"

  token_lifetime         = 86400 # 24 hours
  token_lifetime_for_web = 86400 # 24 hours

  skip_consent_for_verifiable_first_party_clients = true
}

/* resource "auth0_tenant" "tenant" {
  # The tenant need to be already created
  # Terraform will update the settings to match the definition
  friendly_name    = "Core Auth Tenant"
  default_audience = "core-auth-api"

  default_directory = auth0_connection.email.name

  flags {
    enable_custom_domain_in_emails = false # @todo TGFT-352 add back var.custom_domain upon understanding the domain NOT ready problem
  }

  session_lifetime = 720
  sandbox_version  = "16"
}

resource "auth0_client" "client" {
  name                                = "Core Auth (managed by Terraform)"
  description                         = "Core Auth (managed by Terraform)"
  app_type                            = "non_interactive"
  custom_login_page_on                = true
  is_first_party                      = true
  is_token_endpoint_ip_header_trusted = false
  token_endpoint_auth_method          = "none"
  oidc_conformant                     = false
  callbacks                           = var.client_callbacks
  allowed_origins                     = var.client_allowed_origins
  grant_types                         = ["authorization_code", "implicit", "refresh_token"]
  allowed_logout_urls                 = var.client_allowed_logout_urls
  web_origins                         = var.client_web_origins
  jwt_configuration {
    lifetime_in_seconds = 300
    secret_encoded      = true
    alg                 = "RS256"
  }
}

resource "auth0_connection" "auth0_db" {
  strategy        = "auth0"
  name            = "auth0"
  enabled_clients = [auth0_client.client.id, var.auth0_client_id]
}

# Note that Auth0 dashboard doesn't display the connection created with Email strategy
# You can see the connections created by using the API
resource "auth0_connection" "email" {
  strategy        = "email"
  name            = "email2"
  enabled_clients = [auth0_client.client.id, var.auth0_client_id]
  options {
    from    = var.email_sender
    subject = "TheGuarantors - Login"
    syntax  = "liquid"
    name    = "TheGuarantors"
    #    disable_signup = true
    totp {
      time_step = 300
      length    = 6
    }
  }
} */
