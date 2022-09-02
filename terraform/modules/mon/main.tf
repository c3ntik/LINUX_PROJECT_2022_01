resource "yandex_compute_instance" "mon" {
  name                      = "mon"
  hostname                  = "mon"
  allow_stopping_for_update = true

  resources {
    cores         = "4"
    memory        = "8"
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = "10"
      type     = "network-ssd"
      name     = "mon-ssd"
    }
  }

  network_interface {
    subnet_id  = var.subnet_id
    ip_address = "10.10.10.20"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
