data "checkpoint_management_show_objects" "query" {
    type = "host"
    filter = "jims host"
}

output "testing2" {
  value = data.checkpoint_management_show_objects.query.objects[0].uid
}

# terraform plan -generate-config-out=imported-nets.tf
import {
    to = checkpoint_management_host.imported
    id = data.checkpoint_management_show_objects.query.objects[0].uid
}

// Trigger the publish resource every time there is a change on any of the configuration files
// Expression to use to hash all *.tf files in root directory
locals {
  publish_triggers = [for filename in fileset(path.module, "./*.tf"): filesha256(filename)]
}

// Triggers publish if any of the hashes of the files in the root directory changed.
resource "checkpoint_management_publish" "publish" {
  #depends_on = [ checkpoint_management_host.imported ]
  triggers = local.publish_triggers
  run_publish_on_destroy = true
}
