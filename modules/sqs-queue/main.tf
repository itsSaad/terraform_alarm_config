################################################################################################
################################### Variables
################################################################################################
variable "queue_name" {}

################################################################################################
################################### Data
################################################################################################

################################################################################################
################################### Resources
################################################################################################
resource "aws_sqs_queue" "queue" {
  name = "${var.queue_name}"
}