# output "first_arn" {
#     value = aws_iam_user.example[0].arn
#     description = "The ARN of the first user"
# }

# output "all_arns" {
#     value = aws_iam_user.example[*].arn
#     description = "The ARN for all users"
# }

output "user_arns" {
    value = module.users[*].user_arn
    description = "The ARN pf the created IAM users"
}