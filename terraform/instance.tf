
resource "aws_instance" "test-instance" {
    ami = "${data.aws_ami.ubuntu-docker.id}"
    key_name = var.key_pair_name
    instance_type = var.instance_type
    subnet_id = aws_subnet.test_subnet.id
    vpc_security_group_ids = [aws_security_group.test_security_group.id]
    associate_public_ip_address = true
    
    provisioner "remote-exec" {
        inline = ["echo 'Wait until SSH is ready'"]

        connection {
            type = "ssh"
            user = var.ssh_user
            private_key = var.private_key
            host = self.public_ip
        }
    }
    
    provisioner "local-exec" {
        command = "ssh-keyscan ${aws_instance.test-instance.public_ip} >> ~/.ssh/known_hosts"
    }

    # provisioner "local-exec" {
    #     command = "ansible-playbook -i ${aws_instance.test-instance.public_ip}, --private-key ${var.private_key} ../ansible/playbook.yaml"    
    # }
}

output "instance_ip" {
    value = aws_instance.test-instance.public_ip
}
