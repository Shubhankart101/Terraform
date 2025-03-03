provider "aws" {
  region = "ap-south-1"
}

variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = ["Value1", "Value2"]
}

variable "mymap" {
    type = map
    default = {
        Key1 = "Value1"
        Key2 = "Value2"
    }
}

variable "inputname" {
    type = string
    description = "enter the value of vpc name"  
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
#      Name = var.vpcname
      Name = var.inputname
    }
}