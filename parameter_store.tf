resource "aws_ssm_parameter" "vpc_id" {
  name  = "/roboshop/dev/vpc_id"
  type  = "String"
  value = local.vpc_id
}

resource "aws_ssm_parameter" "SG_id" {
  name  = "/roboshop/dev/SG_id"
  type  = "String"
  value = local.sg_id
}
resource "aws_ssm_parameter" "public_subnet_cidr" {
  name  = "/roboshop/dev/public_subnet_cidr"
  type  = "StringList"
  value = join(",", local.public_subnet_ids)
}
resource "aws_ssm_parameter" "database_subnet_cidr" {
  name  = "/roboshop/dev/database_subnet_cidr"
  type  = "StringList"
  value = join(",", local.database_subnet_ids)
}
resource "aws_ssm_parameter" "private_subnet_cidr" {
  name  = "/roboshop/dev/private_subnet_cidr"
  type  = "StringList"
  value = join(",", local.database_subnet_ids)
}