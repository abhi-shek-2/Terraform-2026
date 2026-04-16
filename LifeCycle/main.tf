
#prevent_destroy
resource "aws_s3_bucket" "Bucket_example" {
  bucket = var.bucket_name

  tags = var.common_tags
  lifecycle {
    prevent_destroy = false
  }
}


#create_before_destroy
resource "aws_instance" "server1" {
  ami = data.aws_ami.ubuntu.id
  # count         = 2
  instance_type = var.instance_type
  tags          = var.common_tags
  lifecycle {
    create_before_destroy = true
  }
}

#ignore_changes
resource "aws_launch_template" "instance_template" {
  name = "launch-Template"
  image_id = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  tags = var.common_tags
  
}

resource "aws_autoscaling_group" "asg_group" {
  name = "ASG-Group"
  max_size = 3
  min_size = 1
  desired_capacity = 2
  health_check_type = "EC2"
  availability_zones = data.aws_availability_zones.available.names
  lifecycle {
    ignore_changes = [ desired_capacity ]
  }
  launch_template {
    id = aws_launch_template.instance_template.id
    version = "$Latest"
  }
}

# replace_triggered_by

resource "aws_security_group" "terraform_learning_sg" {
  name =  "security_group_1"
  description = "Example SG creation"
  ingress  {
    from_port  = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from Anywhere"
  }

  ingress  {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS trrafic from anywhere"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow outbound traffic"
  }

  tags = var.common_tags  
}

resource "aws_instance" "example_instance" {
  vpc_security_group_ids = [aws_security_group.terraform_learning_sg.id]
  instance_type = var.instance_type
  ami = data.aws_ami.ubuntu.id
  tags = var.common_tags
  lifecycle {
    replace_triggered_by = [ aws_security_group.terraform_learning_sg ]
  }
}
