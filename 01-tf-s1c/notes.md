# Build simple Check Point policy with IAC using Terraforom  

**Prepare the enviroment**

You need to add the following Codespace secrets
* CHECKPOINT_API_KEY 
* CHECKPOINT_SERVER
* CHECKPOINT_CLOUD_MGMT_ID

Here are the instruction on how to add Codespace secrets: https://docs.github.com/en/codespaces/managing-your-codespaces/managing-your-account-specific-secrets-for-github-codespaces#adding-a-secret

Login in to your infinity account https://portal.checkpoint.com and deploy a new Smart-1 Cloud application, you can select demo for a 24h runtime.

Go to **Smart-1 Cloud** > **API & SmartConsole** and generate a Management API key. Copy this key to a CHECKPOINT_API_KEY codespace secrets

Under the **Web request structure** section you can find the sever fqdn and cloud management ID for you Smart-1 Cloud service, add thes to the following codespace secrets

* CHECKPOINT_SERVER
* CHECKPOINT_CLOUD_MGMT_ID

Launch your code space in your fork of the repository by clicking on **Code** > **Codespaces** > **Create codespace on main**

You are now ready to deploy the policy using terraform in codespace
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