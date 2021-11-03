# Databricks-terraform-stack
The main.tf and variables.tf file will provide the logic to the create the following databricks resources:

Cluster,
Notebook,
Job,
Secret

It will require access to an existing premium databricks workspace. The following snippet can be used as the main.tf and variables.tf files to create the premium workspace.

![image](https://user-images.githubusercontent.com/59668937/140088884-3f15b112-49a1-4d8f-bdf1-29549fd19b9b.png)


![image](https://user-images.githubusercontent.com/59668937/140089030-e795fb67-e5c4-4471-b5df-1a24a9be17c4.png)

Once the workspace has been created, and logged into. Use the main.tf and variables.tf files to provision the remaining resources.
