################################################################################################
################################### Topics
################################################################################################
module "topic-default" {
  source                  = "../../modules/sns-topic"
  topic_name              = "default_topic"
  topic_protocol          = "sms"
  topic_protocol_endpoint = "+31000000000"
}

################################################################################################
################################### Queues
################################################################################################

module "queue1" {
  source     = "../../modules/sqs-queue"
  queue_name = "${lookup(var.alarms[0], "dimension_value")}"
}

module "queue2" {
  source     = "../../modules/sqs-queue"
  queue_name = "${lookup(var.alarms[1], "dimension_value")}"
}

################################################################################################
################################### Queue Alarms
################################################################################################

module "nfh-queue-alarms-0" {
  source        = "../../modules/cw-alarm"
  alarm_data    = "${merge(var.default_alarm_attributes,var.alarms[0])}"
  alarm_actions = ["${module.topic-default.topic_arn}"]
}

module "nfh-queue-alarms-1" {
  source        = "../../modules/cw-alarm"
  alarm_data    = "${merge(var.default_alarm_attributes,var.alarms[1])}"
  alarm_actions = "${list(module.topic-default.topic_arn)}"
}
