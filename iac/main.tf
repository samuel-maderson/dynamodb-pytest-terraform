
module "custom_vpc" {
    source = "./src/vpc"
      
    vpc = {
      aws_region = var.project.region
      environment = var.project.environment
      project_name = var.project.name
      vpc_cidr_block = var.vpc.vpc_cidr_block
      vpc_public_subnets = var.vpc.vpc_public_subnets
      vpc_private_subnets = var.vpc.vpc_private_subnets
      vpc_enable_nat_gateway = var.vpc.vpc_enable_nat_gateway  
    }
}


module "custom_dynamodb" {
    source = "./src/dynamodb"

    dynamodb = {
      aws_region = var.project.region
      environment = var.project.environment
      project_name = var.project.name
      table_name = var.dynamodb.table_name
      read_capacity = var.dynamodb.read_capacity
      write_capacity = var.dynamodb.write_capacity
      billing_mode = var.dynamodb.billing_mode
      hash_key = var.dynamodb.hash_key
      range_key = var.dynamodb.range_key
    }
}