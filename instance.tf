# ------------------------------------------------------------------------------
# Create EC2 Instance - Web
# ------------------------------------------------------------------------------

# Define webserver inside the public subnet
resource "aws_instance" "wb" {
  ami                         = "${var.ami}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.default.id}"
  subnet_id                   = "${aws_subnet.public-subnet.id}"
  vpc_security_group_ids      = ["${aws_security_group.sg-web.id}"]
  associate_public_ip_address = true
  source_dest_check           = false
  # user_data                   = "${file("install.sh")}"

  tags = {
    Name = "kevin-webserver"
  }
}

# ------------------------------------------------------------------------------
# Create EC2 Instance - Web
# ------------------------------------------------------------------------------

# Define database inside the private subnet
resource "aws_instance" "db" {
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  key_name               = "${aws_key_pair.default.id}"
  subnet_id              = "${aws_subnet.private-subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.sg-db.id}"]
  source_dest_check      = false

  tags = {
    Name = "kevin-database"
  }
}
