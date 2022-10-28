provider "aws" {
    region = "eu-north-1"
}
variable "vpcname" {
    type = string
    default = "myVpc"
}
variable "cidrblock" {
    type = string
    default = "10.0.0.0/16"
}

variable "sshport" {
    type = number
    default = 22
}

variable "hasFtp" {
    default = false
}

variable "vpcs" {
    type = list(string)
    default = ["vpc0", "vpc1", "vpc2"]
}

variable "srv" {
    type = map
    default = {
        inerface = "eth0"
        adress = "10.0.3.4"
        os = "linux"
        kernel = 4.16
    }
}

variable "input" {
    type = string
    description = "Enter the VPC name"
}

resource "aws_vpc" "myVpc" {
    cidr_block = var.cidrblock
    tags = {
        Name = var.input
    }

}

variable "myTuple"  {
    type = tuple([string, number, string])
    default = ["a", 1, "2"]
}
variable  "myObject" {
  type = object({ key1 = string, key2 = list(number)})
  default = {
    key1 = "serverName"
    key2 = [22, 25, 80]
  }
}