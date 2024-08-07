output "aws_cli_commands" {
  description = "AWS CLI Command for CloudFront operations."

  value = {
    create_invalidation = "aws cloudfront create-invalidation --distribution-id '${module.web_redirects.aws_cloudfront_distribution.id}' --paths '/*'"
  }
}

output "aws_cloudfront_aliases" {
  description = "Exported Attributes for `module.web_redirects.aws_cloudfront_distribution.aliases`."
  value       = module.web_redirects.aws_cloudfront_distribution.aliases
}

output "aws_cloudfront_domain_name" {
  description = "Exported Attribute for `module.web_redirects.aws_cloudfront_distribution.domain_name`."
  value       = module.web_redirects.aws_cloudfront_distribution.domain_name
}

output "aws_console_urls" {
  description = "AWS Console URLs."

  value = [
    "https://s3.console.aws.amazon.com/s3/buckets/${module.web_redirects.aws_s3_bucket.bucket}?region=${var.management_region_aws}&tab=objects",
    "https://us-east-1.console.aws.amazon.com/cloudfront/v3/home?region=${var.management_region_aws}#/distributions/${module.web_redirects.aws_cloudfront_distribution.id}"
  ]
}

output "aws_s3_bucket" {
  description = "Exported Attribute for `module.web_redirects.aws_s3_bucket`."
  value       = module.web_redirects.aws_s3_bucket.bucket
}

output "redirects" {
  description = "List of URL Redirects."

  # iterate over URL Redirects
  value = {
    for redirect in var.redirects :
    redirect.name => redirect.target
  }
}

output "tfe_workspace_terraform_version" {
  description = "Terraform version identifier of current HCP Terraform Workspace."
  value       = data.tfe_workspace.main.terraform_version
}
