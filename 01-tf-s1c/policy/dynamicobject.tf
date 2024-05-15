resource "checkpoint_management_dynamic_object" "localgatewayexternal" {
      name = "${random_id.id.hex}-LocalGatewayExternal"
      color = "blue"
        }

resource "checkpoint_management_dynamic_object" "localgatewayinternal" {
      name = "${random_id.id.hex}-LocalGatewayInternal"
      color = "blue"
        }
