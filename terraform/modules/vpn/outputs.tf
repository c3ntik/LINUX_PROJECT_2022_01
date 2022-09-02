output "server_ip_vpn" {
  value = yandex_compute_instance.vpn.network_interface.0.nat_ip_address
}

