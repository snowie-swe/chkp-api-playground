# Import Check Point host object 
### To state file and generte terrafrom configuration block

* Create a new host object on the management server
* Edit ``` main.tf```  and chage the filter parameter to match the name of your host onbject
* run ```terraform init```
* run ```terraform plan -generate-config-out=policy/generated.tf``` this will generate the terraform configuration block
* run ```terraform apply``` this will imprt the object to the terrafrom state file
* Make some changes to the code block in the ``` generated.tf``` 
  * Do not change the name as it will make the query datasource unable to find the object and cause terraform to fail.
* run ```terraform apply``` and see the changed beeing applied int SmartConsol
* Delete the object in SmartConsole and publish
* run ```terraform apply``` and see that the objec is recreated by terrafrom as since terraform is now the source of truth for this object
* Delete the code block from terrrafrom, run ```terraform apply``` and see that the host object is deleted in SmartConsole