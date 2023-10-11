module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  for_each = var.instances
  name = each.key
    ami = local.ami_id
  instance_type          = each.value
  vpc_security_group_ids = ["${local.sg_id}"]
  subnet_id              = each.key=="web" ? local.public_subnet_ids[0] : local.private_subnet_ids[0]
    instance_tags = merge({
        "Name" = "${each.key}"
    },{
        "environment" = "Dev"
        "terraform" = "true"
    })
    
}

module "ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  
  name = "ansible"
    ami = local.ami_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${local.sg_id}"]
  subnet_id              = local.public_subnet_ids[0]
  user_data = file("./user.sh")
    instance_tags = merge({
        "Name" = "ansible"
    },{
        "environment" = "Dev"
        "terraform" = "true"
    })
    
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"

    zone_name = "saikiransudhireddy.com"
    for_each = var.instances
     records = [
    {
      name    = each.key
      type    = "A"
      ttl = 1
      records = ["${each.key=="web" ? module.ec2_instance[each.key].public_ip : module.ec2_instance[each.key].private_ip}"]
      }]
    }
