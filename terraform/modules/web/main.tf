resource "yandex_compute_instance" "web" {
  name                      = "web"
  hostname                  = "web"
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
      name     = "web-ssd"
    }
  }

  network_interface {
    subnet_id  = var.subnet_id
    ip_address = "10.10.10.50"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
