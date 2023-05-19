variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

variable "domain" {
  type        = string
  description = "Parent Domain."
  default     = "workloads.io"
}

variable "subdomain" {
  type        = string
  description = "Subdomain."
  default     = "go"
}
