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
      name   = "tw"
      target = "https://twitter.com/wrklds"
    },
  ]
}

variable "subdomain" {
  type        = string
  description = "Subdomain."
  default     = "go"
}
