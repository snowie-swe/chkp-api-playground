          
          resource "checkpoint_management_access_section" "autoscalejumphostsection" {
              name = "${random_id.id.b64_url}-Jump Host access"
              position = {top = "top"}
              layer = "${checkpoint_management_package.AWS_AutoScale.name} Network"
             }
          resource "checkpoint_management_access_rule" "rule1" {
                enabled = true
                name = "${random_id.id.b64_url}-Jump Host Rule"
                source = [ checkpoint_management_dns_domain.jumphost.name ]
                destination = [ "Any" ]
                service = ["ssh", "https"]
                action = "Accept"
                layer = "${checkpoint_management_package.AWS_AutoScale.name} Network"
                action_settings = {
                  enable_identity_captive_portal = false
                  }
                track = {
                  accounting = false
	            alert = "none"
                  enable_firewall_session = true
                  per_connection = true
                  per_session = true
                  type = "Log"
                  }
                position = {below = checkpoint_management_access_section.autoscalejumphostsection.name}
                                }
          resource "checkpoint_management_access_rule" "rule2" {
                name = "${random_id.id.b64_url}-Internal Access"
                destination = [checkpoint_management_network.vpc_local.name]
                destination_negate = false
                source = [checkpoint_management_network.vpc_local.name]
                service = [ "Any" ]
                enabled = true
                action = "Accept"
                layer = "${checkpoint_management_package.AWS_AutoScale.name} Network"
                action_settings = {
                  enable_identity_captive_portal = false
                  }
                track = {
                  accounting = false
	            alert = "none"
                  enable_firewall_session = true
                  per_connection = true
                  per_session = true
                  type = "Log"
                  }
                position = {below = checkpoint_management_access_rule.rule1.name }
                    }

           resource "checkpoint_management_access_rule" "rule3" {
                name = "${random_id.id.b64_url}-Internet Access"
                source = [checkpoint_management_network.vpc_local.name]
                destination = [ "Any" ]
                service = [ "Any" ]
                enabled = true
                action = "Accept"
                layer = "${checkpoint_management_package.AWS_AutoScale.name} Network"
                action_settings = {
                  enable_identity_captive_portal = false
                  }
                track = {
                  accounting = false
	            alert = "none"
                  enable_firewall_session = true
                  per_connection = true
                  per_session = true
                  type = "Log"
                  }
                position = {below = checkpoint_management_access_rule.rule2.name}
                    }

          resource "checkpoint_management_access_rule" "rule4" {
                name = "${random_id.id.b64_url}-Inbound Access"
                source = [ "Any" ]
                destination = [checkpoint_management_dynamic_object.localgatewayexternal.name]
                service = [ checkpoint_management_service_tcp.tcp8090.name, checkpoint_management_service_tcp.tcp33890.name]
                enabled = true
                action = "Accept"
                layer = "${checkpoint_management_package.AWS_AutoScale.name} Network"
                action_settings = {
                  enable_identity_captive_portal = false
                  }
                track = {
                  accounting = false
	            alert = "none"
                  enable_firewall_session = true
                  per_connection = true
                  per_session = true
                  type = "Log"
                  }
                position = {below = checkpoint_management_access_rule.rule3.name}
                }

          resource "checkpoint_management_access_section" "autoscalecleanupsection" {
              name = "${random_id.id.b64_url}-Cleanup Rules"
              position = {above = "Cleanup rule"}
              layer = "${checkpoint_management_package.AWS_AutoScale.name} Network"
              depends_on = [ checkpoint_management_access_rule.rule4 ] 
             }

           
