provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "AWS-instance" {
  count 	= 1 
  ami           = "ami-0ee415e1b8b71305f"
  instance_type = "t2.micro"
  key_name      = "x21196354-Shalini-KeyPair"
  tags = {
    Name = "Node1"
  }
 
provisioner "file" {
source      = "./install.sh"
destination = "/home/ec2-user/install.sh"
}

provisioner "remote-exec" {
inline = [
"chmod 777 ./install.sh",
"./install.sh"
]
}

connection {
type        = "ssh"
host        = self.public_ip
user        = "ec2-user"
private_key = file("./x21196354-Shalini-KeyPair.pem")
timeout     = "4m"
}

}
