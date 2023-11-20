resource "aws_vpc" "infrastructure_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name = "2-tier-architecture-vpc"
  }
}

# internet gateway
resource "aws_internet_gateway" "tier_architecture_igw" {
  vpc_id = aws_vpc.infrastructure_vpc.id
  tags = {
    Name = "2-tier-architecture-igw"
  }
}
# subnets public
resource "aws_subnet" "ec2_1_public_subnet" {
  vpc_id     = aws_vpc.infrastructure_vpc.id
  cidr_block = var.subnet_cidrs[1]
  map_customer_owned_ip_on_launch = "true"
  availability_zone = var.availability_zone[0]

  tags = {
    Name = "first ec2 public subnet"
  }
}

resource "aws_subnet" "ec2_2_public_subnet" {
  vpc_id     = aws_vpc.infrastructure_vpc.id
  cidr_block = var.subnet_cidrs[2]
  map_customer_owned_ip_on_launch = "true"
  availability_zone = var.availability_zone[1]
  tags = {
    Name = "second ec2 public subnet"
  }
}

# database private subnet
resource "aws_subnet" "database_private_subnet" {
  vpc_id     = aws_vpc.infrastructure_vpc.id
  cidr_block = var.subnet_cidrs[4]
  map_customer_owned_ip_on_launch = "false"
  availability_zone = var.availability_zone[1]

  tags = {
    Name = "database private subnet"
  }
}

# read replica
resource "aws_subnet" "database_read_replica_private_subnet" {
  vpc_id     = aws_vpc.infrastructure_vpc.id
  cidr_block = var.subnet_cidrs[3]
  map_customer_owned_ip_on_launch = "false"
  availability_zone = var.availability_zone[0]

  tags = {
    Name = "database read replica private subnet"
  }
}




