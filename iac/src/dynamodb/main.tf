resource "aws_dynamodb_table" "dynamodb-table" {
  name           = var.dynamodb.table_name
  billing_mode   = var.dynamodb.billing_mode
  read_capacity  = var.dynamodb.read_capacity
  write_capacity = var.dynamodb.write_capacity
  hash_key       = var.dynamodb.hash_key
  range_key      = var.dynamodb.range_key

  attribute {
    name = var.dynamodb.hash_key
    type = "S"
  }

  attribute {
    name = var.dynamodb.range_key
    type = "S"
  }

  tags = {
    Name        = "${var.dynamodb.environment}-${var.dynamodb.project_name}"
    Environment = var.dynamodb.environment
  }
}