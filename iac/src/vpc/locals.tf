# Define Local Values in Terraform
locals {
  owners = var.vpc.project_name
  environment = var.vpc.environment
  name = "${var.vpc.environment}-${var.vpc.project_name}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
} 