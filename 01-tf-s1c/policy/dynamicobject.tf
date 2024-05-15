resource "checkpoint_management_dynamic_object" "localgatewayexternal" {
      name = "${random_id.id.b64_url}-LocalGatewayExternal"
      color = "blue"
        }

resource "checkpoint_management_dynamic_object" "localgatewayinternal" {
      name = "${random_id.id.b64_url}-LocalGatewayInternal"
      color = "blue"
        }
