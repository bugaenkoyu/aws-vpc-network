
module "Networking" {
  source               = "./modules/Networking"
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = var.availability_zones
  private_data_cidr    = var.private_data_cidr

}

