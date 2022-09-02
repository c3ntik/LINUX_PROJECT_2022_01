provider "yandex" {
  service_account_key_file = file("~/yandex-cloud/YC_SRV_ACC_KEY.json")
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

### NETWORK ###
module "vpc" {
  source = "./modules/vpc"
  zone   = var.zone
}

### VPN HOST ###
module "vpn" {
  source          = "./modules/vpn"
  public_key_path = var.public_key_path
  vpn_image_id    = var.vpn_image_id
  subnet_id       = module.vpc.subnet_id
}

### GATEWAY HOST ###
module "gate" {
  source          = "./modules/gate"
  public_key_path = var.public_key_path
  image_id        = var.image_id
  gate_public_ip  = var.gate_public_ip
  subnet_id       = module.vpc.subnet_id
}

### MONITORING HOST ###
module "mon" {
  source          = "./modules/mon"
  public_key_path = var.public_key_path
  image_id        = var.image_id
  subnet_id       = module.vpc.subnet_id
}

### WEB HOST ###
module "web" {
  source          = "./modules/web"
  public_key_path = var.public_key_path
  image_id        = var.image_id
  subnet_id       = module.vpc.subnet_id
}

### LOGGING HOST ###
module "log" {
  source          = "./modules/log"
  public_key_path = var.public_key_path
  image_id        = var.image_id
  subnet_id       = module.vpc.subnet_id
}

### BACKUP HOST ###
module "backup" {
  source          = "./modules/backup"
  public_key_path = var.public_key_path
  image_id        = var.image_id
  subnet_id       = module.vpc.subnet_id
}

### SQL01 HOST ###
module "sql01" {
  source          = "./modules/sql01"
  public_key_path = var.public_key_path
  image_id        = var.image_id
  subnet_id       = module.vpc.subnet_id
}

### SQL02 HOST ###
module "sql02" {
  source          = "./modules/sql02"
  public_key_path = var.public_key_path
  image_id        = var.image_id
  subnet_id       = module.vpc.subnet_id
}