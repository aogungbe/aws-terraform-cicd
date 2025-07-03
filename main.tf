provider "aws" {
    region = "us-east-1"
}
resource "aws_security_group" "allow_ssh_eduwa"{
    name = "allow_ssh_eduwa"
    description = "Allow inbound SSH traffic int the instance"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "test_eduwa" {
    ami = "ami-0c6ebb5b9bce4ba15"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_eduwa.id]
    tags = {
        Name = "terraform-demo"
    }
}
resource "aws_s3_bucket" "test-bucket" {
    bucket = "eduwa-test-bucket1"
    acl = "private"
}
