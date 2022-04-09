# This is to create aws instane in Mumbai Region 

resource "aws_instance" "web" {
  count         = "2"
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = var.instance_type
  subnet_id     = "subnet-0496128e977f28b29"
  key_name      = "Demo_key"
  tags = {
    Name = "Terraform_New_Module_Demo"
  }
  vpc_security_group_ids = [aws_security_group.allow_http.id]
  user_data              = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd.service
              systemctl enable httpd.service
              echo "Welcome to Terraform Demo!!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
              EOF
}
