resource "yandex_compute_instance" "log" {
  name                      = "log"
  hostname                  = "log"
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
      name     = "log-ssd"
    }
  }

  secondary_disk {
    disk_id = yandex_compute_disk.log-hdd.id
  }

  network_interface {
    subnet_id  = var.subnet_id
    ip_address = "10.10.10.30"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}

resource "yandex_compute_disk" "log-hdd" {

  name = "log-hdd"
  type = "network-hdd"
  size = "10"
}