# Terraform docs:
# https://www.terraform.io/docs/providers/aws/r/iam_role.html
#
# Example:
#

# Create and configure IAM role
resource "aws_iam_role" "kentik-vpc-logs" {
  name               = "kentik-vpc-logs"
  description        = "A role to access flow logs for ingest clusters"
  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::834693425129:role/eks-ingest-node"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    Provisioner = "Terraform"
  }
}

resource "aws_iam_role_policy_attachment" "kentik-vpc-logs-AmazonS3FullAccess-attach" {
  role       = aws_iam_role.kentik-vpc-logs.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_role_policy_attachment" "kentik-vpc-logs-AmazonEC2ReadOnlyAccess-attach" {
  role       = aws_iam_role.kentik-vpc-logs.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

