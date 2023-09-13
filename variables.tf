variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

variable "domain" {
  type        = string
  description = "Parent Domain."
  default     = "workloads.io"
}

variable "redirects" {
  type = list(object({
    name       = string
    target     = string
    utm_source = optional(string, "WKLDS_GO")
  }))

  description = "List of Redirect Objects."

  default = [
    {
      name   = "aws-regional",
      target = "https://github.com/workloads/regional-aws-deployment",
      }, {
      name   = "azure-regional",
      target = "https://github.com/workloads/regional-azure-deployment",
      }, {
      name   = "bsky",
      target = "https://staging.bsky.app/profile/workloads.bsky.social",
      }, {
      # general Discord Invite
      name   = "discord",
      target = "https://discord.gg/7dYVHzBT58",
      }, {
      # Discord Invite, specific to `minecraft-bots` channel
      name   = "discord-mc",
      target = "https://discord.gg/7dYVHzBT58",
      }, {
      name   = "do-regional",
      target = "https://github.com/workloads/regional-do-deployment",
      }, {
      name   = "gcp-regional",
      target = "https://github.com/workloads/regional-gcp-deployment",
      }, {
      name   = "gh"
      target = "https://github.com/workloads"
      }, {
      name   = "home"
      target = "https://workloads.io/"
      }, {
      name   = "license"
      target = "https://github.com/workloads/.github/blob/main/LICENSE"
      }, {
      name   = "kb"
      target = "https://keybase.io/workloads"
      }, {
      name   = "privacy-policy"
      target = "https://github.com/workloads/.github/blob/main/PRIVACY.md"
    },{
      name   = "tw"
      target = "https://twitter.com/wrklds"
      }, {
      name   = "x"
      target = "https://x.com/wrklds"
    },
  ]
}

variable "subdomain" {
  type        = string
  description = "Subdomain."
  default     = "go"
}
