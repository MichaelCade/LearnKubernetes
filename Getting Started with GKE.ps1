#Make sure you have the Google Cloud SDK Installed on your system 

#Deploy GKE Cluster (basic)
gcloud container clusters create cluster-name --num-nodes=1

#Confirm access to new GKE Cluster 
kubectl get nodes 

#Available Kubernetes versions 
gcloud container get-server-config

#Deploy GKE Cluster with latest version of Kubernetes 
gcloud container clusters create cluster-name --num-nodes=1 --cluster-version=latest

#Available Machine Types 
gcloud compute machine-types list

#Deploy GKE Cluster with latest version of Kubernetes and a specific machine type 
gcloud container clusters create cluster-name --num-nodes=1 --cluster-version=latest --machine-type=n1-standard-2 

#Deploy GKE Cluster with the latest version of Kubernetes, specific machine type and a number of nodes (default if not specified is 3)
gcloud container clusters create cluster-name --num-nodes=4 --cluster-version=latest --machine-type=n1-standard-2

#Deploy GKE Cluster with the latest version of Kubernetes, specific machine type, number of nodes, and specify regional cluster meaning you will get 2 nodes in each zone of the regional
gcloud container clusters create cluster-name --num-nodes=2 --cluster-version=latest --machine-type=n1-standard-2 --region=europe-west2

#Delete GKE Cluster 
gcloud container clusters delete cluster-name

#Delete GKE Cluster with regional flag and multiple zones 
gcloud container clusters delete cluster-name --zone=europe-west2
