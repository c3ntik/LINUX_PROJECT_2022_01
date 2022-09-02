output "server_ip_gate" {
  value = yandex_compute_instance.gate.network_interface.0.nat_ip_address
}

