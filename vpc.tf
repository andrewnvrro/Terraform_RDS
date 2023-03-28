resource "aws_vpc" "NavarroVPC" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"

    tags = {
      "Name" = "NavarroVPC"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = "${aws_vpc.NavarroVPC.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "false"
    
}

