# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#schema
provider "aws" {
  region = var.management_region_aws

  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#default_tags
  default_tags {
    tags = {
      "github:url" = "https://github.com/workloads/web-redirects"
    }
  }
}

# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#schema
# This aliased version of the provider is specifically limited to the `us-east-1`
# region to allow for lifecycle operations for ACM resources.
provider "aws" {
  alias  = "certificate"
  region = "us-east-1"

  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#default_tags
  default_tags {
    tags = {
      "github:url" = "https://github.com/workloads/web-redirects"
    }
  }
}

# The TFE Provider is set to retrieve configuration from `variables.tf` and the environment
# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs
provider "tfe" {
  alias = "viewer"

  hostname        = "app.terraform.io"
  ssl_skip_verify = false
  token           = var.tfe_team_token_viewers
}
