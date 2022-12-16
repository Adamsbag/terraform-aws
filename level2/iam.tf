resource "aws_iam_policy" "main" {
  name        = var.env_code
  description = var.env_code
  policy      = <<EOF
{
   "Version": "2012-10-17",
     "Statement": [
       {
           "Effect": "Allow",
           "Action": "s3:*",
           "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role" "main" {
  name               = var.env_code
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.main.name
  policy_arn = aws_iam_policy.main.arn
}

resource "aws_iam_instance_profile" "main" {
  name = var.env_code
  role = aws_iam_role.main.name
}
