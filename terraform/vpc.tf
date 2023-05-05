resource "aws_vpc" "test_vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = "Test VPC"
        DeleteMe = "Yes"
    }
}

resource "aws_internet_gateway" "test_internet_gateway" {
    vpc_id = aws_vpc.test_vpc.id
    tags = {
        Name = "Test Internet Gateway"
        DeleteMe = "Yes"
    }
}

resource "aws_route_table" "test_route_table_us_east_1a_public" {
    vpc_id = aws_vpc.test_vpc.id
    route {
        cidr_block = var.route_table_cidr_block
        gateway_id = aws_internet_gateway.test_internet_gateway.id
    }
    tags = {
        Name = "Test Route Table"
        DeleteMe = "Yes"
    }
}

resource "aws_route_table_association" "test_route_table_association" {
    subnet_id = aws_subnet.test_subnet.id
    route_table_id = aws_route_table.test_route_table_us_east_1a_public.id
}
