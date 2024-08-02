resource "aws_db_subnet_group" "rds" {
  name       = "${var.db_subnet_group_name}"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_subnet_group_name}"
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id
  name   = "${var.vpc_name}-rds-sg"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-rds-sg"
  }
}

resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true

  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.rds.name

  tags = {
    Name = "${var.db_instance_name}"
  }
}
