# output "first_arn" {
#     value = aws_iam_user.example[0].arn
#     description = "The ARN of the first user"
# }

# output "all_arns" {
#     value = values(aws_iam_user.example)[*].arn
#     description = "The ARN for all users"
# }

output "user_arn" {
    value = values(module.users)[*].user_arn
    description = "The ARN of the created user"
}

output "upper_names" {
  value = [for name in var.user_names : upper(name) if length(name) < 5]
}