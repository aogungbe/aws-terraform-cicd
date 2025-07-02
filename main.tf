provider "aws" {
    region = "us-east-1"
}
resource "aws_security_group" "allow_ssh"{
    name = "allow_ssh"
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
resource "aws_instance" "test" {
    ami = "ami-0c6ebb5b9bce4ba15"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
        Name = "terraform-demo"
    }
}
resource "aws_s3_bucket" "test-bucket" {
    bucket = "subbys-test-bucket1"
    acl = "private"
}