# Terraform docs:
# https://www.terraform.io/docs/providers/aws/r/flow_log.html
#
# Example:
#

resource "aws_flow_log" "my-vpc-flowlog" {
  log_destination      = aws_s3_bucket.my-flow-logs-bucket.arn
  log_destination_type = "s3"
  traffic_type         = "ACCEPT"
  vpc_id               = aws_vpc.my-vpc.id
}

