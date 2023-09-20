provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket  = "terraformbook7645-state"
    region  = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
    key     = "prod/data-stores/mysql/terraform.tfstate"
  }
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  db_name             = var.db_name
  username = var.db_username
  password = var.db_password
}