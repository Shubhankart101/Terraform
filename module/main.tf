provider "aws" {
  region = "ap-south-1"
}

# variable "servernames" {
#   type = list()
#   default = ["dev", "test", "prod"]
# }

module "ec2" {
  source = "./ec2"
#  for_each = totest(var.servernames)
  for_each = toset(["dev", "test", "prod"])
#  count = 2
}