# output "first_arn" {
#     value = aws_iam_user.example[0].arn
#     description = "The ARN of the first user"
# }

# output "all_arns" {
#     value = values(aws_iam_user.example)[*].arn
#     description = "The ARN for all users"
# }

# output "user_arn" {
#     value = values(module.users)[*].user_arn
#     description = "The ARN of the created user"
# }

# output "names" {
#   value = [for name in var.names : upper(name) if length(name) < 5]
# }

output "for_directive" {
  value = "%{for i, name in var.names} text (${i}) ${name}, %{ endfor }}"
}

# output "bios" {
#  value = {for name, role in var.hero_thousand_faces: name => role}
# }
