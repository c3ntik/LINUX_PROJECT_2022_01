output "server_ip_mon" {
  value = yandex_compute_instance.mon.network_interface.0.nat_ip_address
}

