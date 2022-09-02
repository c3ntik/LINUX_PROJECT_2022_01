resource "yandex_vpc_network" "linux-project-net" {
  name = "linux-project-net"
}

resource "yandex_vpc_subnet" "linux-project-subnet" {
  name           = "linux-project-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.linux-project-net.id
  v4_cidr_blocks = ["10.10.10.0/24"]
}
