resource "aws_subnet" "rate-website_subnet" {
    vpc_id = aws_vpc.rate-website_vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.availability_zone
    tags = {
        Name = "rate-website Subnet"
        DeleteMe = "Yes"
    }
}