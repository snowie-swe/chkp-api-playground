terraform {
   required_providers {
     checkpoint = {
       source = "checkpointsw/checkpoint"
#       version = "~> 1.1.0"
     }
   }
}

provider "checkpoint" {
  # Configuration options
/*
  # Smart-1 Cloud example
  server        = "chkp-jim-xxx-nxx22x11.maas.checkpoint.com"
  api_key       = "XYZbv4ZyxdM+SdtjRI8AmjA=="
  context       = "web_api"
  cloud_mgmt_id = "77zz4yxx-c457-4646-8e63-d67e55345af8"
  timeout       = "120"
*/
/*
  # On premises Management example  
  server        = "192.168.233.40"
  #api_key      = ""
  username      = "api_user"
  password      = "vpn123"
  #domain       = "Domain Name"
  context       = "web_api"
  timeout       = "120"
*/
}
