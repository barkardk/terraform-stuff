provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-05c42683296709b61"
    instance_type = "t3.micro"
}

resource "aws_eip" "eip" {
    instance = aws_instance.ec2.id
}

output "eip" {
    value = aws_eip.eip.public_ip
}