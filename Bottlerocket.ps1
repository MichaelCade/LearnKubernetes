#Create a keypair 
aws ec2 create-key-pair --key-name bottlerocket --query "bottlerocket" --output text > bottlerocket.pem

#Create EKS Cluster based on yaml configuration (16 mins)
eksctl create cluster --config-file "D:\Personal OneDrive\OneDrive\Veeam Live Documentation\Blog\AWS EKS Setup\bottlerocket-cluster.yaml" 

#Confirm you have access to your new EKS Cluster 
kubectl get nodes 

#The above doesnt show your OS image used so run the following to confirm Bottlerocket is being used. 
kubectl get nodes -o=wide 

#Delete the cluster 
eksctl delete cluster --config-file "D:\Personal OneDrive\OneDrive\Veeam Live Documentation\Blog\AWS EKS Setup\bottlerocket-cluster.yaml"
aws ec2 delete-key-pair --key-name bottlerocket

#Resources 
#bottlerocket - https://docs.aws.amazon.com/eks/latest/userguide/launch-node-bottlerocket.html