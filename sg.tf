resource "aws_internet_gateway" "NavarroIGW" {
    vpc_id = "${aws_vpc.NavarroVPC.id}"
    tags = {
      "Name" = "NavarroIGW"
    }
}

resource "aws_route_table" "NavarroRT" {
    vpc_id = "${aws_vpc.NavarroVPC.id}"

    route {
        cidr_block = "0.0.0.0/0"

        gateway_id = "${aws_internet_gateway.NavarroIGW.id}"
    }

    
    tags = {
      "Name" = "NavarroRT"
    }
}

resource "aws_route_table_association" "public-subnet-1" {
    subnet_id = "${aws_subnet.public_subnet.id}"
    route_table_id = "${aws_route_table.NavarroRT.id}"
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow SSH connection in the EC2 instance"
    vpc_id = "${aws_vpc.NavarroVPC.id}"

  ingress{
    description = "SSH from port 22"
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]   
  }

  tags = {
    "Name" = "Allow SSH"
  }

}