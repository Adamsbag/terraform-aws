module "rds" {
  source = "../modules/rds"

  subnet_ids            = data.terraform_remote_state.level1.outputs.private_subnet_id
  env_code              = var.env_code
  rds_password          = local.rds_password
  vpc_id                = data.terraform_remote_state.level1.outputs.vpc_id
  source_security_group = module.asg.security_group_id
}
