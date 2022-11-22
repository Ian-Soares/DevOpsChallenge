module "s3" {
  source           = "./modules/s3"
  bucket_id        = var.bucket_id
  mime_types       = var.mime_types
  upload_directory = var.upload_directory
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  bucket_domain_name = module.s3.bucket_regional_domain_name
  aliases_cf         = var.aliases_cf
}