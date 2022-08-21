#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath="981293034142.dkr.ecr.us-east-1.amazonaws.com/baolm1"
dockerpath=minhbao03/baolm


# Step 2
# Run the Docker Hub container with kubernetes
# kubectl create secret docker-registry awscreds \
#   --docker-server=https://981293034142.dkr.ecr.us-east-1.amazonaws.com \
#   --docker-username=AWS \
#   --docker-password=$(aws ecr get-login-password --region us-east-1 ) -n kube-system

#   kubectl apply -f deployment.yaml
# r=$(kubectl get pod baolm1 2> /dev/null;echo $?)

# if [ "_$r" == "_1" ] ; then
#     kubectl run baolm2 \
#     --image=$dockerpath \
#     --image-pull-policy="Never" \
#     --overrides='{"apiVersion": "v1", "spec":{"imagePullSecrets": [{"name": "regcred"}]}}'
# fi
# systemctl stop firewalld
# systemctl disable firewalld
kubectl run baolm --image=minhbao03/baolm:latest --port=80
# aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 981293034142.dkr.ecr.us-east-1.amazonaws.com
# kubectl run baolm2 --image=981293034142.dkr.ecr.us-east-1.amazonaws.com/baolm1:latest --port=80
# kubectl create deployment baolm1 --image=minhbao03/baolm1 --port=80



# Step 3:
# List kubernetes pods
# kubectl get pods -A
kubectl get pods

# Step 4:
# Forward the container port to a host
# kubectl apply -f service.yaml
kubectl port-forward baolm 8080:80

read -t 10 -p "I am going to wait for 10 seconds only ..."