provider "aws" {
  region  = "us-east-2"
  profile = "terraformbook"
}

resource "aws_instance" "example" {
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket  = "terraformbook7645-state"
    key     = "workspaces-example/terraform.tfstate"
    region  = "us-east-2"
    profile = "terraformbook"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}