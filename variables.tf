variable "aws_region" {
  description = "Default Region"
  default     = "us-east-1"
}
variable "availability_zone1" {
  description = "Avaialbility Zone1"
  default     = "us-east-1a"
}

variable "availability_zone2" {
  description = "Avaialbility Zone2"
  default     = "us-east-1a"
}
variable "main_vpc_cidr" {
  description = "CIDR of the VPC"
  default     = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default     = "10.0.2.0/24"
}

variable "ami" {
  description = "Amazon Linux 2 AMI"
  default     = "ami-0b898040803850657"
}

variable "key_path" {
  description = "SSH Public Key path"
  default     = "~/.ssh/kevin-keypair.pub"
}
