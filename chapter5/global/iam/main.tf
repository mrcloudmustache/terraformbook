provider "aws" {
  region = "us-east-2"
}

# resource "aws_iam_user" example {
#     count = length(var.user_names)
#     name = var.user_names[count.index]
# }

module "users" {
  source = "../../modules/landing-zone/iam-user"

  for_each  = toset(var.names)
  user_name = each.value

  give_neo_cloudwatch_full_access = true
}

