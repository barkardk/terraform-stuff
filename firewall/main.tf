provider "aws" {
    region = "eu-north-1"
}

resource  "aws_instance" "ec2" {
    ami = "ami-05c42683296709b61"
    instance_type = "t3.micro"
    security_groups = [ aws_security_group.traffic.name ]
}

resource "aws_eip" "eip" {
    instance = aws_instance.ec2.id
}
resource "aws_security_group" "traffic" {
    egress {
        from_port = 80
        to_port = 80
        cidr_blocks = [ "0.0.0.0/0" ]
        protocol = "TCP"

    }
    ingress {
        from_port = 80
        to_port = 80 
        cidr_blocks = [ "0.0.0.0/0"]
        protocol = "TCP"
    }
}
output "o"{
    value = aws_eip.eip.public_ip
}