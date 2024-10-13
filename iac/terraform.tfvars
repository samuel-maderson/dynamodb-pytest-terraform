project = {
  name = "dynamodb-pytest-terraform"
  region = "us-east-1"
  environment = "dev"
}

vpc = {
  vpc_cidr_block = "10.0.0.0/16"
  vpc_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
  vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  vpc_enable_nat_gateway = true  
}

dynamodb = {
  table_name = "Movies"
  read_capacity = 5
  write_capacity = 5
  billing_mode = "PROVISIONED"
  hash_key = "Year"
  range_key = "Title"
}