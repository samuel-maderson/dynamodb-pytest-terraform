# AWS Availability Zones Datasource
data "aws_availability_zones" "available" {
}

# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  #version = "4.0.1"
  version = "5.4.0"    
  
  # VPC Basic Details
  name = local.name
  cidr = var.vpc.vpc_cidr_block
  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.vpc.vpc_public_subnets
  private_subnets = var.vpc.vpc_private_subnets  

  # Database Subnets
  # database_subnets = var.vpc_database_subnets
  # create_database_subnet_group = var.vpc_create_database_subnet_group
  # create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  # create_database_internet_gateway_route = true
  # create_database_nat_gateway_route = true
  
  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.vpc.vpc_enable_nat_gateway 
  #single_nat_gateway = var.vpc.vpc_single_nat_gateway

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  
  tags = local.common_tags
  vpc_tags = local.common_tags

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
    "dynamodb-pytest-terraform/${local.environment}" = 1    
    "dynamodb-pytest-terraform/${local.environment}" = "shared"        
  }
  private_subnet_tags = {
    Type = "private-subnets"
    "dynamodb-pytest-terraform/${local.environment}" = 1    
    "dynamodb-pytest-terraform/${local.environment}" = "shared"    
  }

  # database_subnet_tags = {
  #   Type = "database-subnets"
  # }
  # Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true  
}