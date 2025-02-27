provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2db" {
    ami = "ami-01a6e31ac994bbc09"
    instance_type = "t2.micro"

    tags = {
      Name = "DB Server"
    }
}

resource "aws_instance" "myec2" {
    ami = "ami-01a6e31ac994bbc09"
    instance_type = "t2.micro"

    tags = {
      Name = "Web Server"
    }

    depends_on = [ aws_instance.myec2db ]
}

data "aws_instance" "dbsearch" {
  filter {
    name = "tag:Name"
    values = ["DB Server"]
  }
}

output "dbservers" {
  value = data.aws_instance.dbsearch.availability_zone
}