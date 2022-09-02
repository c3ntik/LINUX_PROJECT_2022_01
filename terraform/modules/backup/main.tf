resource "yandex_compute_instance" "backup" {
  name                      = "backup"
  hostname                  = "backup"
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
      name     = "backup-ssd"
    }
  }

  secondary_disk {
    disk_id = yandex_compute_disk.backup-hdd.id
  }

  network_interface {
    subnet_id  = var.subnet_id
    ip_address = "10.10.10.40"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}

resource "yandex_compute_disk" "backup-hdd" {

  name = "backup-hdd"
  type = "network-hdd"
  size = "20"
}