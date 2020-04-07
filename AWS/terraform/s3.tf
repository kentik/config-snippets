#
# Terraform docs:
# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
#
# Example:
#


# Create an S3 bucket
resource "aws_s3_bucket" "my-flow-logs-bucket" {
  bucket = "my-flow-logs-bucket"

  versioning {
    enabled = false
  }

  tags = {
    Provisioner = "Terraform"
  }
}

