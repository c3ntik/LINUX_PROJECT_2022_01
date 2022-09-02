output "server_ip_log" {
  value = yandex_compute_instance.log.network_interface.0.nat_ip_address
}

