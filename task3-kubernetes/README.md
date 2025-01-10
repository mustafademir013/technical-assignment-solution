# Task 3: Kubernetes Deployment

## Overview
This project implements a high-availability Node.js application deployment on Kubernetes with auto-scaling capabilities.

## Components

### deployment.yaml
- High availability with 3 replicas
- Rolling update strategy
- CPU and Memory limits
- Health checks (liveness and readiness probes)
- Container configuration
- Docker image: mustafademir013/myapp:latest

### service.yaml
- LoadBalancer type service
- Port mapping from 80 to 5000
- Pod load balancing
- Automatic service discovery

### ingress.yaml
- Nginx Ingress controller integration
- Domain-based routing (app.example.com)
- SSL redirect configuration
- Path-based routing

## Setup Instructions

### Prerequisites
- Kubernetes cluster (minikube, kind, etc.)
- kubectl CLI tool

### Kubernetes Deployment
1. Navigate to the project directory:
```bash
cd task3-kubernetes
```

2. Create Kubernetes resources:
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```

3. Verify deployment status:
```bash
kubectl get pods
kubectl get services
kubectl get ingress
```

### Local Testing

1. Test with port-forwarding:
```bash
kubectl port-forward service/myapp-service 8080:80
# Access via http://localhost:8080
```

2. Test with Ingress:
```bash
# Add entry to /etc/hosts file
echo "127.0.0.1 app.example.com" | sudo tee -a /etc/hosts

# Enable Ingress addon for Minikube
minikube addons enable ingress

# Access via http://app.example.com
```

### Troubleshooting

```bash
# View pod logs
kubectl logs -l app=myapp

# Describe pod details
kubectl describe pod <pod-name>

# Describe service details
kubectl describe service myapp-service

# Describe ingress details
kubectl describe ingress myapp-ingress
```

## Scaling

Scale the number of pods:
```bash
kubectl scale deployment myapp-deployment --replicas=5
```

## Updates

Update to a new image version:
```bash
kubectl set image deployment/myapp-deployment myapp=mustafademir013/myapp:new-version
```

## Monitoring

```bash
# Watch pod status
kubectl get pods -w

# Check service status
kubectl get svc myapp-service

# Check deployment rollout status
kubectl rollout status deployment/myapp-deployment
```
## Test Results
| Environment | Test Status |
|--------------     |-------------|
| Orbstack Kubernetes on MacOs | ✅ Success |
   