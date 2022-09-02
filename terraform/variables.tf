variable "cloud_id" {
  description = "Cloud ID"
}
variable "folder_id" {
  description = "Folder ID"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}
variable "image_id" {
  description = "Disk image"
}
variable "vpn_image_id" {
  description = "VPN Disk image"
}
variable "gate_public_ip" {
  description = "GATE Public IP"
}
variable "subnet_id" {
  description = "Subnet ID"
}
