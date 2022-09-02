output "server_ip_sql01" {
  value = yandex_compute_instance.sql01.network_interface.0.nat_ip_address
}

