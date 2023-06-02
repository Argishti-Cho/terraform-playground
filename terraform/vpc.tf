resource "aws_vpc" "rate-website_vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = "rate-website VPC"
        DeleteMe = "Yes"
    }
}

resource "aws_internet_gateway" "rate-website_internet_gateway" {
    vpc_id = aws_vpc.rate-website_vpc.id
    tags = {
        Name = "rate-website Internet Gateway"
        DeleteMe = "Yes"
    }
}

resource "aws_route_table" "rate-website_route_table_us_east_1a_public" {
    vpc_id = aws_vpc.rate-website_vpc.id
    route {
        cidr_block = var.route_table_cidr_block
        gateway_id = aws_internet_gateway.rate-website_internet_gateway.id
    }
    tags = {
        Name = "rate-website Route Table"
        DeleteMe = "Yes"
    }
}

resource "aws_route_table_association" "rate-website_route_table_association" {
    subnet_id = aws_subnet.rate-website_subnet.id
    route_table_id = aws_route_table.rate-website_route_table_us_east_1a_public.id
}
