variable default_alarm_attributes {
  type = "map"

  default = {
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = "1"
    metric_name         = "ApproximateNumberOfMessagesVisible"
    namespace           = "AWS/SQS"
    period              = "60"
    statistic           = "Average"
    threshold           = "10"
    alarm_description   = "This is just a description"
    dimension_name      = "QueueName"
    treat_missing_data  = "missing"
  }
}

variable alarms {
  type = "list"

  default = [
    {
      alarm_name         = "alarm for Queue1"
      evaluation_periods = "1"
      alarm_description  = "This monitors the queue and sends an alert"
      dimension_value    = "Queue1"
      threshold          = "0"
      treat_missing_data = "breaching"
    },
    {
      alarm_name      = "alarm_1"
      threshold       = "50"
      dimension_value = "Queue1"
    },
  ]
}
