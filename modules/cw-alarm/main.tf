################################################################################################
################################### Variables
################################################################################################
variable alarm_actions {
  type = "list"
}

variable alarm_data {
  type = "map"
}

################################################################################################
################################### Data
################################################################################################

################################################################################################
################################### Resources
################################################################################################
resource "aws_cloudwatch_metric_alarm" "alarms" {
  alarm_name          = "${lookup(var.alarm_data, "alarm_name")}"
  comparison_operator = "${lookup(var.alarm_data, "comparison_operator")}"
  evaluation_periods  = "${lookup(var.alarm_data, "evaluation_periods")}"
  metric_name         = "${lookup(var.alarm_data, "metric_name")}"
  namespace           = "${lookup(var.alarm_data, "namespace")}"
  period              = "${lookup(var.alarm_data, "period")}"
  statistic           = "${lookup(var.alarm_data, "statistic")}"
  threshold           = "${lookup(var.alarm_data, "threshold")}"
  alarm_description   = "${lookup(var.alarm_data, "alarm_description")}"
  alarm_actions       = ["${var.alarm_actions}"]
  treat_missing_data  = "${lookup(var.alarm_data, "treat_missing_data")}"

  dimensions {
    Name  = "${lookup(var.alarm_data, "dimension_name")}"
    Value = "${lookup(var.alarm_data, "dimension_value")}"
  }
}
