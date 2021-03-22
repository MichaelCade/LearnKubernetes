#Local Az PowerShell creating AKS cluster 

$ResourceGroupName = "CadeAKS"
$ClusterName = "CadeAKSCluster"
$ClusterLocation = "eastus"
$NodeCount = "3"

#Web Browser will open to authenticate against your subscription 
Connect-AzAccount 

#Create a New resource group 
New-AzResourceGroup -Name $ResourceGroupName -Location $ClusterLocation

#Create the AKS cluster, GenerateSshKey is used here to authenticate to the cluster from the local machine. 
New-AzAksCluster -ResourceGroupName $ResourceGroupName -Name $ClusterName -NodeCount $NodeCount -GenerateSshKey -KubernetesVersion 1.19.7

New-AzAksCluster -ResourceGroupName $ResourceGroupName -Name $ClusterName -NodeCount $NodeCount -SshKeyValue 'C:\\Users\micha\\.ssh\\id_rsa'

#This will install Kubectl but i am not sure if this is needed if you already have kubectl on your system will have to test that. 
Install-AzAksKubectl

#Now we need to add our AKS context so we can connect 
Import-AzAksCredential -ResourceGroupName $ResourceGroupName -Name $ClusterName -Force 

#Confirm that you have access to your cluster       
kubectl get nodes

#If you have multiple contexts and you want to list them 
kubectl config get-contexts

#change name below to the context you wish to jump to 
kubectl config use-context NAME 

kubectl create namespace kasten-io

#To Delete your cluster run the following command
Remove-AzResourceGroup -Name $ResourceGroupName -force
Remove-Item C:\Users\micha\.ssh\id_rsa