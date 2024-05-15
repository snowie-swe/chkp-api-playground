data "checkpoint_management_show_objects" "query" {
    type = "host"
    filter = "my-jimo-host"
}

# terraform plan -generate-config-out=imported-nets.tf
import {
    to = checkpoint_management_host.imported
    id = data.checkpoint_management_show_objects.query.objects[0].uid
}