resource "aws_dynamodb_table" "table" {
    name = var.table_name
    billing_mode = var.billing_mode
    read_capacity= var.read_capacity
    write_capacity= var.write_capacity
    hash_key = var.hash_key


    attribute {
    name = var.attribute1
    type = "S"
    }
    attribute {
    name = var.attribute2
    type = "S"
    }
    
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["iot.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}