# Import Check Point host object 
### To state file and generte terrafrom configuration block

**Note:** Remember to save any chages made in a file before moving to next step, this can be done by pressing ctrl+s

* Using Web SmartConsole in S1C, create a new **host object** on the **management server**
* Edit **main.tf**
  1. Change the **filter** parameter to in the **checkpoint_management_show_objects** block match the name of the  host object you created.
  2. Remove the multi line comment "/*" "*/" from the **import** block to activate import of resource it should look like this:
  
     ```
     import { 
         to = checkpoint_management_host.imported
         id = data.checkpoint_management_show_objects.query.objects[0].uid 
     }
      ```
* run **terraform init**
* run **terraform plan -generate-config-out=policy/generated.tf** this will generate the terraform configuration block and save the file in the **./policy** folder
* Terrafrom import block is a exprimental feature, th import{} does not natively support to import within modules, as a workaroundm, edit **main.tf**
  1.  Add **module.policy.** 
   to the line **checkpoint_management_host.imported** in the **import** block. The result should look something like this
        ```
       import { 
           to = module.policy.checkpoint_management_host.imported
           id = data.checkpoint_management_show_objects.query.objects[0].  uid 
       }
        ```
  2 run ***terraform apply*** this will import the object to the terrafrom state file
* Make some changes to the code block in the **./policy/generated.tf**
  * Do not change the name as it will make the query datasource unable to find the object and cause terraform to fail.
* run **terraform apply** and see the changed beeing applied int SmartConsol
* Delete the object in **SmartConsole** and **publish**.
* run **terraform apply** and see that the objec is recreated by terrafrom since terraform is now the source of truth for this object.
* Delete the code block in **./policy/generated.tf** file , and run **terraform apply** and see that the host object is deleted in SmartConsole.