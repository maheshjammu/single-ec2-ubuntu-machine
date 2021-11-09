resource "aws_instance" "UbuntuServer" {
    #ami = "${data.aws_ami.my_ami.id}"
    ami = "ami-00782a7608c7fc226"
    #availability_zone = "ap-south-1"
    instance_type = "t2.micro"
    key_name = "ubuntu_key"
    subnet_id = "${aws_subnet.subnet1-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
        Name = "JAMMU_UBUNTU_SERVER"
      }
}

# resource "null_resource" "cluster" {
#     provisioner "file" {
#     source      = "script.sh"
#     destination = "/tmp/script.sh"
#     connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     #password = "India@123456"
#     private_key = "${file("LaptopKey.pem")}"
#     host     = "${aws_instance.web-1.public_ip}"
#     }
#     }

#     provisioner "remote-exec" {
#     inline = [
#       #"chmod +x /tmp/script.sh",
#       #"sudo ./tmp/script.sh",
#       "sudo yum update -y",
#       "sudo yum install nginx -y",
#       "sudo service nginx start"

#       ]
#     connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     #password = "India@123456"
#     private_key = "${file("LaptopKey.pem")}"
#     host     = "${aws_instance.web-1.public_ip}"
#     }
#     }

#     provisioner "local-exec" {
#     command = <<EOH
#       echo "${aws_instance.web-1.public_ip}" >> details && echo "${aws_instance.web-1.private_ip}" >> details,
#     EOH
#     }

# }
