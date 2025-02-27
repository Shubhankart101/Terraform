provider "aws" {
  region = "ap-south-1"
}

variable "vpcname" {
    type = string  
}

resource "aws_vpc" "myvpc" {                                #setx TF_VAR_vpcname "envvpc"(Windows)
    cidr_block = "10.0.0.0/16"                              #export TF_VAR_vpcname=envvpc (Linux)
                                                            #terraform plan -var="vpcname=clivar"
    tags = {                                                #setx TF_LOGS "TRACE" 
      Name = var.vpcname                                    #export TF_LOGS=TRACE 
    }
}