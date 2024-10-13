locals {
    environment = var.dynamodb.environment
    name = "${var.dynamodb.environment}-${var.dynamodb.project_name}"

    common_tags = {
        environment = var.dynamodb.environment
    }
}