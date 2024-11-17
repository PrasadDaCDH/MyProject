# Reference the existing security group by its ID
#data "aws_security_group" "existing-sg" {
#  id = "sg-0847e674c2ce08dc2"  # Replace with the actual security group ID
#}

# Update the security group to add new ingress rules (example: allow HTTP on port 80)
resource "aws_security_group_rule" "allow_all_to_cluster" {
  type        = "ingress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my-cicd-project-cluster-sg.id
}

resource "aws_security_group_rule" "allow_http_to_cluster" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my-cicd-project-cluster-sg.id
}

resource "aws_security_group_rule" "allow_http_to_node" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my-cicd-project-node-sg.id
}

resource "aws_security_group_rule" "allow_all_to_node" {
 type              = "ingress"
 description       = "allow all"
 from_port         = 0
 to_port           = 0
 protocol          = "-1"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.my-cicd-project-node-sg.id
}
