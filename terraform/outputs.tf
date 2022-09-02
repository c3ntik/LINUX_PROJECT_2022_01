output "server_ip_vpn" {
  value = module.vpn.server_ip_vpn
}
output "server_ip_gate" {
  value = module.gate.server_ip_gate
}
output "server_ip_mon" {
  value = module.mon.server_ip_mon
}
output "server_ip_web" {
  value = module.web.server_ip_web
}
output "server_ip_log" {
  value = module.log.server_ip_log
}
output "server_ip_backup" {
  value = module.backup.server_ip_backup
}
output "server_ip_sql01" {
  value = module.sql01.server_ip_sql01
}
output "server_ip_sql02" {
  value = module.sql02.server_ip_sql02
}
resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      server_ip_vpn    = module.vpn,
      server_ip_gate   = module.gate,
      server_ip_mon    = module.mon,
      server_ip_web    = module.web,
      server_ip_log    = module.log,
      server_ip_backup = module.backup,
      server_ip_sql01  = module.sql01,
      server_ip_sql02  = module.sql02,
    }
  )
  filename             = "../ansible/environments/inventory"
  directory_permission = "0755"
  file_permission      = "0644"
}
