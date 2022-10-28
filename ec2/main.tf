provider "aws" {
    region = "eu-north-1"
}
resource "aws_instance" "kristin" {
    ami = "ami-05c42683296709b61"
    instance_type = "t3.micro"
}