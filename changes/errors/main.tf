provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-02abf8a9db9720053"
    instance_type = "t2.micro"
}