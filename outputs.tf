output "aws_cli_commands" {
  description = "AWS CLI Command for CloudFront operations."

  value = {
    create_invalidation = "aws cloudfront create-invalidation --distribution-id '${module.web_redirects.aws_cloudfront_distribution.id}' --paths '/*'"
  }
}

output "aws_cloudfront_aliases" {
  description = "Exported Attributes for `module.web_redirects.aws_cloudfront_distribution.aliases`."
  value = module.web_redirects.aws_cloudfront_distribution.aliases
}

output "aws_cloudfront_domain_name" {
  description = "Exported Attribute for `module.web_redirects.aws_cloudfront_distribution.domain_name`."
  value       = module.web_redirects.aws_cloudfront_distribution.domain_name
}

output "aws_console_urls" {
  description = "AWS Console URLs."
  value = [
    "https://us-east-1.console.aws.amazon.com/cloudfront/v3/home?region=${var.management_region_aws}#/distributions/${module.web_redirects.aws_cloudfront_distribution.id}"
  ]
}

output "aws_s3_bucket" {
  description = "Exported Attribute for `module.web_redirects.aws_s3_bucket`."
  value       = module.web_redirects.aws_s3_bucket.bucket
}
