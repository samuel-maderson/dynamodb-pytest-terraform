
module "custom_vpc" {
    source = "./src/vpc"
      
    vpc = {
      
      ### common
      aws_region = var.project.region
      environment = var.project.environment
      project_name = var.project.name
      vpc_cidr_block = var.vpc.vpc_cidr_block
      vpc_public_subnets = var.vpc.vpc_public_subnets
      vpc_private_subnets = var.vpc.vpc_private_subnets
      vpc_enable_nat_gateway = var.vpc.vpc_enable_nat_gateway  
    }
}