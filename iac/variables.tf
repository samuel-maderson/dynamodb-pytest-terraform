variable "project" {
    type = object({
      name = string
      region = string
      environment = string
    })
}

variable "vpc" {
  type = object({
    vpc_cidr_block = string
    vpc_public_subnets = list(string)
    vpc_private_subnets = list(string)
    vpc_enable_nat_gateway = bool  
  })
}

# variable "dynamodb" {
#   type = object({

#   })
# }