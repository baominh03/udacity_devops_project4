#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
# dockerpath=981293034142.dkr.ecr.us-east-1.amazonaws.com/baolm1
dockerpath=minhbao03/baolm

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
# aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 981293034142.dkr.ecr.us-east-1.amazonaws.com
# docker tag baolm1:latest 981293034142.dkr.ecr.us-east-1.amazonaws.com/baolm1:latest

# docker login -u minhbao03
docker tag baolm $dockerpath:latest

# Step 3:
# Push image to a docker repository
# docker push 981293034142.dkr.ecr.us-east-1.amazonaws.com/baolm1:latest
docker push $dockerpath:latest


read -t 10 -p "I am going to wait for 10 seconds only ..."