provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA6FCAHIYNBFZBP7AS"
  secret_key = "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"
}
resource "aws_instance" "one" {
  ami                    = "ami-01a4f99c4ac11b03c"
  instance_type          = "t2.medium"
  key_name               = "terrakp"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone      = "ap-south-1a"
  user_data              = <<EOF

#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hi this is terraform projectr created on ap -south 1 server -1" > /var/www/html/index.html
EOF
  tags {
    Name = "swiggy-1"
  }
}
resource "aws_instance" "two" {
  ami                    = "ami-01a4f99c4ac11b03c"
  instance_type          = "t2.medium"
  key_name               = "terrakp"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone      = "ap-south-1b"
  user_data              = <<EOF

#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hi this is terraform projectr created on ap -south 1b server -2" > /var/www/html/index.html
EOF
  tags {
    Name = "swiggy-2"
  }
}

