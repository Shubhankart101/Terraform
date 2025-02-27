provider "aws" {
  region = "ap-south-1"
}

variable "environment" {
  type = string
}

# variable "number_of_servers" {
#   type = number
# }

resource "aws_instance" "myec2" {
    ami = "ami-02abf8a9db9720053"
    instance_type = "t2.micro"
    # count = var.number_of_servers
    count = var.environment == "prod" ? 1 : 0
}