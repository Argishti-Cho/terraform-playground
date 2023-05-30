data "aws_ami" "ubuntu-docker" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "RateImage"
  }
}