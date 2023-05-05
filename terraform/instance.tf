
resource "aws_instance" "test-instance" {
    ami = var.ami_id
    key_name = var.key_pair_name
    instance_type = var.instance_type
    subnet_id = aws_subnet.test_subnet.id
    vpc_security_group_ids = [aws_security_group.test_security_group.id]
    associate_public_ip_address = true
    # provisioner "remote-exec" {
    #     connection {
    #         type = "ssh"
    #         user = "ubuntu"
    #         private_key = file(var.private_key_path)
    #         host = self.public_ip
    #     }
    #}
}