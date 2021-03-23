#Using the AWS CLI to deploy an Amazon EKS cluster

#Install EKSCTL on Windows with Chocolatey 
choco install -y eksctl

#Start by configuring your AWS CLI to work with the correct IAM and region 
aws configure

#Create an Amazon EKS Cluster with specified name, region, nodegroup and node type 
eksctl create cluster --name mc-eks --region eu-west-2 --nodegroup-name standard --node-type t3.small --managed 

#Create an Amazon EKS Cluster with specified name, region, nodegroup and using existing SSH public key
eksctl create cluster --name mc-eks --region eu-west-2 --nodegroup-name standard --managed --ssh-access --ssh-public-key=MCEKS1 --nodes 3 --nodes-min 1 --nodes-max 4

#SSH connection to your nodes (change to your public DNS)
ssh ec2-user@ec2-18-130-232-27.eu-west-2.compute.amazonaws.com -i C:\Users\micha\.kube\MCEKS1.pem

#You can get the above DNS by running the following command 
aws ec2 describe-instances --filters Name=instance-type,Values=m5.large

#If this is the only compute nodes you have running then you may not need a filter 
aws ec2 describe-instances

#Delete Amazon EKS Cluster 
eksctl delete cluster --name=mc-eks 