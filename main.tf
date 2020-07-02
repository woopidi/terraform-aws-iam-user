resource "aws_iam_user" "user" {
  name = var.name;
}

resource "aws_iam_user_policy" "user_policy" {
  name = "${var.name}_user_policy"
  user = aws_iam_user.user.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::${var.media_domain_name}",
        "arn:aws:s3:::${var.media_domain_name}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
          "ses:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}