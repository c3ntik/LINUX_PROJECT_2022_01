output "server_ip_backup" {
  value = yandex_compute_instance.backup.network_interface.0.nat_ip_address
}

