data "checkpoint_management_show_objects" "query" {
    type = "host"
    filter = "jims host"
}

# terraform plan -generate-config-out=policy/generated.tf
/*import {
    to = checkpoint_management_host.imported
    id = data.checkpoint_management_show_objects.query.objects[0].uid
}*/

module "policy" {
  source = "./policy"
}

// Trigger the publish resource every time there is a change on any of the configuration files in a specific module
// Expression to use to hash all files in directory policy that is used by the policy module
locals {
  publish_triggers = [for filename in fileset(path.module, "policy/*.tf"): filesha256(filename)]
}

// Triggers publish if any of the hashes of the files in the policy directory changed.
resource "checkpoint_management_publish" "publish" {
  depends_on = [ module.policy ]
  triggers = local.publish_triggers
  run_publish_on_destroy = true
}
