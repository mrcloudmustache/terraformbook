provider "aws" {
    region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket  = "terraformbook7645-state"
    region  = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
    key     = "prod/services/webserver-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
    source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "terraformbook7645-state"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

instance_type = "m4.large"
  min_size      = 2
  max_size      = 10
}