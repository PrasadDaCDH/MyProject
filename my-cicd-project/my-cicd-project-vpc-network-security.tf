# Define the provider
provider "aws" {
  region = "ap-south-1" # Replace with your desired region
}

# Create an S3 bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-cicd-project-backend-ap-south-1" # Ensure this is globally unique
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "retain-versioned-state"
    enabled = true

    noncurrent_version_expiration {
      days = 30
    }
  }
}

# Create a DynamoDB table for state locking and consistency
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


# Create a VPC
resource "aws_vpc" "my-cicd-project-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-cicd-project-vpc"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my-cicd-project-igw" {
  vpc_id = aws_vpc.my-cicd-project-vpc.id

  tags = {
    Name = "my-cicd-project-igw"
  }
}

# Create a Route Table
resource "aws_route_table" "my-cicd-project-route-table" {
  vpc_id = aws_vpc.my-cicd-project-vpc.id

  tags = {
    Name = "my-cicd-project-route-table"
  }
}


# Create Subnets
resource "aws_subnet" "my-cicd-project-subnet-1" {
  vpc_id            = aws_vpc.my-cicd-project-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-cicd-project-subnet-1"
  }
}

#Craeting subnet-2
resource "aws_subnet" "my-cicd-project-subnet-2" {
  vpc_id            = aws_vpc.my-cicd-project-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-cicd-project-subnet-2"
  }
}

#Craeting Private subnet-3

resource "aws_subnet" "my-cicd-project-subnet-3" {
  vpc_id            = aws_vpc.my-cicd-project-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "my-cicd-project-subnet-3"
  }
}

# Create a default route for internet access
resource "aws_route" "my-cicd-project-route" {
  route_table_id         = aws_route_table.my-cicd-project-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my-cicd-project-igw.id
}

# Associate Subnets with the Route Table
resource "aws_route_table_association" "my-cicd-project-subnet-assoc-1" {
  subnet_id      = aws_subnet.my-cicd-project-subnet-1.id
  route_table_id = aws_route_table.my-cicd-project-route-table.id
}

resource "aws_route_table_association" "my-cicd-project-subnet-assoc-2" {
  subnet_id      = aws_subnet.my-cicd-project-subnet-2.id
  route_table_id = aws_route_table.my-cicd-project-route-table.id
}

# Create a NAT Gateway
resource "aws_eip" "my-cicd-project-nat-eip" {
  vpc = true

  tags = {
    Name = "my-cicd-project-nat-eip"
  }
}

resource "aws_nat_gateway" "my-cicd-project-nat-gw" {
  allocation_id = aws_eip.my-cicd-project-nat-eip.id
  subnet_id     = aws_subnet.my-cicd-project-subnet-1.id

  tags = {
    Name = "my-cicd-project-nat-gw"
  }
}

# Create private route table for the private subnet
resource "aws_route_table" "my-cicd-project-private-route-table" {
  vpc_id = aws_vpc.my-cicd-project-vpc.id

  tags = {
    Name = "my-cicd-project-private-route-table"
  }
}

# Add route to NAT Gateway in private route table
resource "aws_route" "my-cicd-project-private-route" {
  route_table_id         = aws_route_table.my-cicd-project-private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.my-cicd-project-nat-gw.id
}

# Associate private subnet with the private route table
resource "aws_route_table_association" "my-cicd-project-subnet-assoc-3" {
  subnet_id      = aws_subnet.my-cicd-project-subnet-3.id
  route_table_id = aws_route_table.my-cicd-project-private-route-table.id
}

#Craeting Security Groups

resource "aws_security_group" "my-cicd-project-cluster-sg" {
  vpc_id = aws_vpc.my-cicd-project-vpc.id
   
  egress = []
  ingress = []

  tags = {
    Name = "my-cicd-project-cluster-sg"
  }
}

resource "aws_security_group" "my-cicd-project-node-sg" {
  vpc_id = aws_vpc.my-cicd-project-vpc.id

  ingress = []
  egress = []
  
  tags = {
    Name = "my-cicd-project-node-sg"
  }
}
