#
# Manage the stream of messages from a single, specific topic, to be delivered to the subscribing application.
#
# Terraform docs:
# https://www.terraform.io/docs/providers/google/r/pubsub_subscription.html
# https://www.terraform.io/docs/providers/google/r/pubsub_topic.html
# https://www.terraform.io/docs/providers/google/r/pubsub_subscription_iam.html
#
# Example:
#
# Create topic
resource "google_pubsub_topic" "my-self-vpc-flows-topic" {
  name = "my-self-vpc-flows-topic"

  labels = {
    provisioner = "terraform"
  }

}

# Create pull subscription
resource "google_pubsub_subscription" "my-self-vpc-flows-subscription" {
  name  = "my-self-vpc-flows-subscription"
  topic = google_pubsub_topic.my-self-vpc-flows-topic.name

  labels = {
    provisioner = "terraform"
  }

  # 1 day
  message_retention_duration = "86400s"
  retain_acked_messages      = false

  ack_deadline_seconds = 10

  expiration_policy {
    ttl = "2678400s"
  }

}

# Set permissions
resource "google_pubsub_subscription_iam_binding" "kentik-pubsub_viewer" {
  subscription = google_pubsub_subscription.my-self-vpc-flows-subscription.name
  role         = "roles/pubsub.viewer"
  members = [
    "serviceAccount:kentik-vpc-flow@kentik-vpc-flow.iam.gserviceaccount.com",
  ]
}
resource "google_pubsub_subscription_iam_binding" "kentik-pubsub_subscriber" {
  subscription = google_pubsub_subscription.my-self-vpc-flows-subscription.name
  role         = "roles/pubsub.subscriber"
  members = [
    "serviceAccount:kentik-vpc-flow@kentik-vpc-flow.iam.gserviceaccount.com",
  ]
}


