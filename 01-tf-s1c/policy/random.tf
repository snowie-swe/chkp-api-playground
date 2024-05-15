resource "random_id" "id" {
	  byte_length = 8
}

/*resource "checkpoint_management_host" "azurelbhealthcheck" {
      name = "${random_id.id.hex}-${random_id.id.hex}-azure_lb_health_check"
      # ...
      }
}*/