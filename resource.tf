resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "grafana_sg" {
  name        = "grafana-security-group"
  description = "Security group for Grafana"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443    # allow traffic from port 443
    to_port     = 443    # to port 443
    protocol    = "tcp"  # using TCP protocol
    cidr_blocks = ["0.0.0.0/0"]  # allow traffic from all sources (IP addresses)
  }

  ingress {
    from_port   = 22     # allow traffic from port 22 (SSH)
    to_port     = 22     # to port 22 (SSH)
    protocol    = "tcp"  # using TCP protocol
    cidr_blocks = ["0.0.0.0/0"]  # allow traffic from all sources (IP addresses)
  }
}

resource "aws_instance" "grafana_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"  # Replace with your desired instance type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.grafana_sg.id]

  provisioner "local-exec" {
    command = "sleep 60"  # Wait for the instance to initialize
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker ubuntu
    sudo docker run -d -p 80:80 -p 3000:3000 --name grafana grafana/grafana:latest

    # Retrieve and store the IP addresses as local variables
    echo "public_ip=\$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)" > /home/ubuntu/ip_addresses.sh
    echo "private_ip=\$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)" >> /home/ubuntu/ip_addresses.sh

    # Display the IP addresses as output
    echo "Public IP: \$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)"
    echo "Private IP: \$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"
  EOF

  tags = {
    Name = "Grafana Instance"
  }
}
