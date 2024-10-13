variable "dynamodb" {
  type = object({
    aws_region = string
    environment = string
    project_name = string

    table_name = string
    read_capacity = number
    write_capacity = number
    billing_mode = string
    hash_key = string
    range_key = string
  })
}