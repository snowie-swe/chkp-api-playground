resource "checkpoint_management_dns_domain" "jumphost" {
  name = ".${random_id.id.b64_url}-curley.duckdns.org"
  is_sub_domain = false
  color = "blue"
  }
