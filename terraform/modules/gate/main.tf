resource "yandex_compute_instance" "gate" {
  name                      = "gate"
  hostname                  = "gate"
  allow_stopping_for_update = true

  resources {
    cores         = "2"
    memory        = "2"
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = "10"
      type     = "network-ssd"
      name     = "gate-ssd"
    }
  }

  network_interface {
    subnet_id  = var.subnet_id
    ip_address = "10.10.10.10"
    nat_ip_address = var.gate_public_ip
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
