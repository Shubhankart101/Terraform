provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-01a6e31ac994bbc09"
    instance_type = "t2.micro"

    tags = {
      Name = "Web Server"
    }
}

module "dbserver" {
#   source = "./db/mysql"
  source = "./db/mariadb"
  dbname = "mydbserver"
}

output "dbprivateip" {
  value = module.dbserver.privateip
}