provider "aws" {
  region = "us-east-2"

  # Tags to apply to all AWS resources
  default_tags {
    tags = {
      Owner     = "team-brady"
      ManagedBy = "Terraform"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "terraformbook7645-state"
    region         = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
    key            = "prod/services/webserver-cluster/terraform.tfstate"
  }
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  ami = "ami-0fb653ca2d3203ac1"
  server_text = "Go Giants Go!!!"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "terraformbook7645-state"
  db_remote_state_key    = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "m4.large"
  min_size      = 2
  max_size      = 10

  enable_autoscaling = true

  custom_tags = {
    Owner     = "team-foo"
    ManagedBy = "terraform"
  }
}

output "alb_dns_name" {
  value       = module.webserver_cluster.alb_dns_name
  description = "The domain name of the load balancer"
}