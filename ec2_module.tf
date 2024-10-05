module "ec2" {
  source        = "./modules"
  instance_type = var.instance_type
  ami           = var.ami
  region        = var.region
}