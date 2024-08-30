provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_role" "role_25992" {
  name = "role_25992"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com",
        },
      },
    ],
  })
}

resource "aws_iam_policy" "policy_25992" {
  name        = "policy_25992"
  description = "My IAM policy"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:ListBucket",
        Effect   = "Allow",
        Resource = "*",
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  policy_arn = aws_iam_policy.policy_25992.arn
  role      = aws_iam_role.role_25992.name
}
