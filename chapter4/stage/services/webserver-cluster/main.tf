provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket  = "terraformbook7645-state"
    region  = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
    key     = "stage/services/webserver-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "terraformbook7645-state"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
}