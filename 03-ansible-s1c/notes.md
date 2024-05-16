# Build and maintain an enterpise Check Point policy with IAC using Ansible   

If you have not already done so, to prepare the enviroment follow the **Prepare the enviroment** steps in the notes.md file i 01-tf-s1c

## Install ansible
Follow these steps to install ansible in your Codespace instance
```bash
sudo apt install pipx -y --no-install-recommends
pipx install --include-deps ansible
```

## Add latest Check Point management ansible collection
got to https://galaxy.ansible.com/ui/repo/published/check_point/mgmt/ to find the instructions on how to install the Check Point management ansible collection

If you get an notification that "Nothing to do. All requested collections are already installed" run the install of the collection again using `--force`

## Deploy the entprise policy using Ansible

You are now ready to deploy and maintain a enterpise policy using ansible in codespace
```bash
# enter this folder
cd 01-tf-s1c/
#
terraform init
terraform apply
# look at the plan and the changes that will be made
# Accept by answerign yes

```

Go to the Web based Smart Console in Smart-1 Cloud and se the changes applied by terraform.