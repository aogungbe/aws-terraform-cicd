provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "test" {
    ami = "ami-0c6ebb5b9bce4ba15"
    instance_type = "t2.micro"
    tags = {
        Name = "terraform-demo"
    }
}