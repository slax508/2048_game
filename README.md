# 2048_game

## Overview
This repository contains the 2048 game deployed on AWS EKS (Elastic Kubernetes Service). The deployment process involves setting up the necessary prerequisites, configuring AWS CLI, creating an EKS cluster, installing ArgoCD, and deploying the game using `kubectl`.

## Prerequisites
Ensure the following tools are installed and configured on your system:
- **EC2 Instance**: A running EC2 instance to act as your deployment environment.
- **AWS CLI**: Install and configure the AWS CLI with your AWS account credentials.
- **kubectl**: Install `kubectl` to interact with the Kubernetes cluster.
- **eksctl**: Install `eksctl` to create and manage EKS clusters.

## Deployment Steps


### 1. Create a EC2
Create a t2.micro EC2 instance and login into it by
ssh -i <keypair.pem> ubuntu@<publicip>
sudo apt update
Install prerequisites i.e AWScli, Kubectl, eksctl.
''''bash
awsconfigure
''''''
### 1. Configure AWS CLI
Run the following command to configure AWS CLI with your account credentials:
```bash
aws configure
```

### 2. Create an EKS Cluster
Use `eksctl` to create an EKS cluster:
```bash
eksctl create cluster --name 2048-game-cluster --region <your-region> --nodes 2
```

### 3. Install ArgoCD
Install ArgoCD using the provided manifest:
```bash
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### 4. Retrieve ArgoCD Admin Password
Retrieve the secret password for the ArgoCD server:
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

### 5. Deploy the 2048 Game
Deploy the 2048 game using `kubectl` commands:
```bash
kubectl apply -f 2048-deployment.yaml
kubectl apply -f 2048-service.yaml
```

### 6. Access the Game
Once deployed, access the game using the external IP of the service:
```bash
kubectl get svc
```

## Notes
- Replace `<your-region>` with your desired AWS region.
- Ensure all YAML files (e.g., `2048-deployment.yaml`, `2048-service.yaml`) are correctly configured before deployment.

Enjoy playing the 2048 game on your Kubernetes cluster!