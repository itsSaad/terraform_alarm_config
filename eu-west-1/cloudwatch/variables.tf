variable aws_region {}


variable alarm_actions {
  type = "map"

  default = {
    "severity1" = "someaction1"
    "severity2" = "someaction2"
    "severity3" = "someaction3"
    "severity4" = "someaction4"
  }
}
