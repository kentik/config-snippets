#
# In order to enable VPC flow logs in the subnetwork, add
# the following section in your google_compute_subnetwork resource
#
# Terraform docs:
# https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html
#
# ```
#    log_config {
#      aggregation_interval = "INTERVAL_5_SEC"
#      flow_sampling        = "0.0"
#      metadata             = "INCLUDE_ALL_METADATA"
#    }
# ```
#
