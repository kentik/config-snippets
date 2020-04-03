#
# Manage a project-level logging sink and export to pubsub topic
# Terraform docs: https://www.terraform.io/docs/providers/google/r/logging_project_sink.html
#
# Example:
#
resource "google_logging_project_sink" "my-self-vpc-flows-sink" {
  name = "my-self-vpc-flows-sink"

  destination = "pubsub.googleapis.com/projects/my-project/topics/my-self-vpc-flows-topic"

  filter = <<EOT
resource.type="gce_subnetwork"
logName="projects/my-project/logs/compute.googleapis.com%2Fvpc_flows"
  EOT

  unique_writer_identity = true
}
