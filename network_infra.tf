# ------------------Non-default VPC
resource "aws_vpc" "my_new_vpc" {
  cidr_block            = var.cidr_block_vpc
  instance_tenancy      = var.instance_tenancy
  enable_dns_hostnames  = true

  tags           = {
    Name         = "${var.prefix}-vpc"
    Created_by   = var.prefix
  }
}

# ------------------Non-default IGW
resource "aws_internet_gateway" "my_igw" {
  vpc_id         = aws_vpc.my_new_vpc.id

  tags           = {
    Name         = "${var.prefix}-igw"
    Created_by   = var.prefix
  }
}

# -----------------Route table public
resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.my_new_vpc.id  
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

    tags         = {
    Name         = "${var.prefix}-rt-public"
    Created_by   = var.prefix
  }
}

# ----------------Route table private
resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.my_new_vpc.id  
  
    tags         = {
    Name         = "${var.prefix}-rt-private"
    Created_by   = var.prefix
  }
}

# -----------------Route table associations
resource "aws_route_table_association" "route_assoc_public" {
  count                   = length(var.sub_cidr_public)
  subnet_id               = element(aws_subnet.my_pub_subnets.*.id, count.index)
  route_table_id          = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "route_assoc_private" {
  count                   = length(var.sub_cidr_private)
  subnet_id               = element(aws_subnet.my_private_subnets.*.id, count.index)
  route_table_id          = aws_route_table.rt-private.id
}

# -----------------Public Subnets
resource "aws_subnet" "my_pub_subnets" {
  count                   = length(var.sub_cidr_public)
  vpc_id                  = aws_vpc.my_new_vpc.id
  cidr_block              = var.sub_cidr_public[count.index]
  availability_zone       = var.az_public[count.index]
  map_public_ip_on_launch = true

  tags           = {
    Name         = "public-subnet-${count.index + 1}"
    Created_by   = var.prefix
    Tier         = "Public"
  }
}

# --------------Private Subnets
resource "aws_subnet" "my_private_subnets" {
  count                   = length(var.sub_cidr_private)
  vpc_id                  = aws_vpc.my_new_vpc.id
  cidr_block              = var.sub_cidr_private[count.index]
  availability_zone       = var.az_private[count.index]
  map_public_ip_on_launch = false

  tags           = {
    Name         = "private-subnet-${count.index + 1}"
    Created_by   = var.prefix
    Tier         = "Private"
  }
}
