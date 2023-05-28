locals {
  # random string for use with S3 Bucket names
  bucket_suffix = "${var.subdomain}-${random_string.bucket_suffix.id}"

  # take domain name and remove dot characters from string, then append suffix with random string
  bucket_name = "${replace(var.domain, ".", "")}-${local.bucket_suffix}"
}

# see https://registry.terraform.io/modules/ksatirli/cloudfront-website/aws/1.0.0
module "web_redirects" {
  source = "../../ksatirli/terraform-aws-cloudfront-website"
  #source  = "ksatirli/cloudfront-website/aws"
  #version = "1.1.0"

  # see https://developer.hashicorp.com/terraform/language/providers/configuration#alias-multiple-provider-configurations
  providers = {
    # NOTE: ACM Certificates for usage with CloudFront must be created in the `us-east-1` region, see https://amzn.to/2TW2J16
    aws.certificate = aws.certificate
  }

  s3_bucket_name = local.bucket_name
  domain_name    = var.domain
  subdomain_name = var.subdomain
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "index" {
  bucket = module.web_redirects.aws_s3_bucket.id

  # see https://developer.hashicorp.com/terraform/language/functions/basename
  key = "index.html"

  # see https://developer.hashicorp.com/terraform/language/functions/templatefile
  content = templatefile("./templates/index.tftpl.html", {
    name      = var.domain
    target    = "https://${var.domain}/"
    timestamp = timestamp()
  })

  content_type     = "text/html"
  content_encoding = "text/html"
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "redirects" {
  for_each = {
    for redirect in var.redirects : redirect.name => redirect
  }

  bucket = module.web_redirects.aws_s3_bucket.id
  key    = each.value.name

  # see https://developer.hashicorp.com/terraform/language/functions/templatefile
  content = templatefile("./templates/index.tftpl.html", {
    name      = each.value.name
    target    = "${each.value.target}?utm_source=${each.value.utm_source}"
    timestamp = timestamp()
  })

  tags = {
    "redirect:key" = each.value.name
    "redirect:url" = each.value.target
  }

  content_type = "text/html"
}
