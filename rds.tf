resource "aws_subnet" "public_subnet2" {
    vpc_id = "${aws_vpc.NavarroVPC.id}"
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-southeast-1a"
}

resource "aws_db_subnet_group" "DBsubnet" {
    name = "db_subnet"
    subnet_ids = [aws_subnet.public_subnet.id,aws_subnet.public_subnet2.id]
  
}

resource "aws_db_instance" "NavarroDB" {
    db_name = "NavarroDB"
    identifier = "navarrodb"
    username = "user1"
    password = "password1"

    allocated_storage = 10
    max_allocated_storage = 50
    
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t2.micro"
    storage_type = "gp2"
    parameter_group_name = "default.mysql5.7"

    publicly_accessible = true
    skip_final_snapshot = true

    db_subnet_group_name = aws_db_subnet_group.DBsubnet.name
    vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
    

    tags = {
      "Name" = "NavarroDB"
    }
}
