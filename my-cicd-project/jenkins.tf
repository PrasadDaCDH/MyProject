# Create Jenkins EC2 instance (with Docker installed)

resource "aws_instance" "my-cicd-project-jenkins" {
  ami           = "ami-09b0a86a2c84101e1" # Ubuntu 22.04 AMI (change for your region)
  instance_type = "t2.xlarge"
  key_name      = "my-cicd-project"  # Replace with your SSH key name
  subnet_id     = aws_subnet.my-cicd-project-subnet-1.id
  security_groups = [aws_security_group.my-cicd-project-cluster-sg.id]
  tags = {
    Name = "Jenkins-Server"
  }

  user_data = <<-EOF
              #!/bin/bash
              # Install OpenJDK 17 JRE Headless
              sudo apt install openjdk-17-jre-headless -y
              
              # Install Docker
              sudo apt-get update
              sudo apt-get install -y ca-certificates curl
              sudo install -m 0755 -d /etc/apt/keyrings
              sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
              sudo chmod a+r /etc/apt/keyrings/docker.asc
              echo "deb [arch=\$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \$(. /etc/os-release && echo "\$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
              sudo apt-get update
              sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

              # Install Jenkins
              sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
              echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
              sudo apt-get update
              sudo apt-get install jenkins -y
              EOF
}
