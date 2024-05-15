resource "random_id" "id" {
	  byte_length = 8
        prefix = "pod-"
}

/*resource "checkpoint_management_host" "azurelbhealthcheck" {
      name = "${random_id.id.b64_url}-azure_lb_health_check"
      # ...
      }
}*/