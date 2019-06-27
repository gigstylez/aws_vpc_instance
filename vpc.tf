# ------------------------------------------------------------------------------
# Create main VPC
# ------------------------------------------------------------------------------

resource "aws_vpc" "main" {
  cidr_block           = "${var.main_vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

# ------------------------------------------------------------------------------
# Create two subnets. 1 public & 1 private
# ------------------------------------------------------------------------------

# Define the public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }
}

# Define the private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.private_subnet_cidr}"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private Subnet"
  }
}

# ------------------------------------------------------------------------------
# Create Internet Gateway
# ------------------------------------------------------------------------------

resource "aws_internet_gateway" "main-igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main-igw"
  }
}

# ------------------------------------------------------------------------------
# Create Public Route Table and attach to IGW
# ------------------------------------------------------------------------------

# Define the route table
resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-igw.id}"
  }

  tags = {
    Name = "Public Subnet RT"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "public-rt" {
  subnet_id      = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}
