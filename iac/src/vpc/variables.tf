variable "vpc" {
  type = object({

    aws_region = string
    environment = string
    project_name = string
    vpc_cidr_block = string
    vpc_public_subnets = list(string)
    vpc_private_subnets = list(string)
    vpc_enable_nat_gateway = bool
  })
}
