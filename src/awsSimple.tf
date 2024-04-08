#################################
##			Variables		   ##
#################################
variable "access_key" {}
variable "secret_key" {}
variable "region" {}


#################################
##			Provider		   ##
#################################
provider "aws" {
  # region = "us-west-1"
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_instance" "example" {
  ami           = "ami-0ebef2838fb2605b7"
  instance_type = "t2.micro"
}