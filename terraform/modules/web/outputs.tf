output "server_ip_web" {
  value = yandex_compute_instance.web.network_interface.0.nat_ip_address
}

