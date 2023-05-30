source "amazon-ebs" "ubuntu-lts" {
  region = "us-east-1"
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
    }
    owners      = ["099720109477"]
    most_recent = true
  }
  instance_type  = "t2.micro"
  ssh_username   = "ubuntu"
  ssh_agent_auth = false

  ami_name    = "ubuntu-docker-{{timestamp}}"
  ami_regions = ["us-east-1"]

  tags = {
    name = "RateImage"
    owner = "shtajiryan"
  }
}

build {
  sources = [
    "source.amazon-ebs.ubuntu-lts",
  ]

  provisioner "ansible" {
    playbook_file = "packer/provisioners/ansible/docker.yml"
    user = "ubuntu"
    ansible_env_vars = [ "ANSIBLE_SSH_ARGS='-o PubkeyAcceptedKeyTypes=+ssh-rsa -o HostkeyAlgorithms=+ssh-rsa'" ]
    }
}