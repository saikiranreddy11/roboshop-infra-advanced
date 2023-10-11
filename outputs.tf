output "vpc"{
    value = module.vpc.vpc.id
   
}





output "eip"{
    value = module.vpc.eip.id
}

output "public_subnet_id"{
    value = module.vpc.public_subnet_id[*]
}

output "private_subnet_id"{
    value = module.vpc.private_subnet_id[*]
}
output "database_subnet_id"{
    value = module.vpc.database_subnet_id[*]
}

output "gw"{
     value = module.vpc.gw.id
}

output "az"{
    value = module.vpc.az
}

output "sg_id"{
    value = module.sg.sg_id
}

output "ami_id"{
    value = data.aws_ami.devops_ami.id
}

# output "ec2"{
#     value = module.ec2_instance
# }   