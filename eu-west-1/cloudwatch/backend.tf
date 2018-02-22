provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    bucket = "saads-terraform-statefiles"
    key    = "eu-west-1/cloudwatch"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "cloudwatch" {
  backend = "s3"

  config {
    bucket = "saads-terraform-statefiles"
    key    = "eu-west-1/cloudwatch"
    region = "eu-west-1"
  }
}
