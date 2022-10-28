provider "aws" {
    region = "eu-north-1"
}

variable "identifyers" {
    type = map
    default = {
        name = "TerraformVPC"
        cidr_block = "192.168.0.0/24"
    }
}

resource "aws_vpc" "challenge1" {
    cidr_block = var.identifyers.cidr_block
  tags = {
    Name = var.identifyers.name
  }
}

output "finished" {
    value = aws_vpc.challenge1.id
}