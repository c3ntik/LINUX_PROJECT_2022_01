output "server_ip_sql02" {
  value = yandex_compute_instance.sql02.network_interface.0.nat_ip_address
}

