#!/usr/bin/env bash

# Step 1:
# This is your Docker ID/path
export dockerpath=rott33/udacity-ml-microservice

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-microservice --image=$dockerpath --port=80 --labels="app=ml-microservice"

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
export POD_NAME=$(kubectl get pod -l app=ml-microservice -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8000:80