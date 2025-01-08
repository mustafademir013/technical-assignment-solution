# Task 3: Kubernetes Deployment

## Overview
This task implements a high-availability Kubernetes deployment with rolling updates and comprehensive monitoring.

## Components
### deployment.yaml
- Pod deployment configuration
- Rolling update strategy
- Resource limits
- Health probes
- Container specifications

### service.yaml
- Service configuration
- Port mappings
- Load balancing
- Service discovery

### ingress.yaml
- Ingress configuration
- Path routing
- TLS configuration
- Load balancer integration

## Deployment Steps
### Prerequisites
- Kubernetes cluster
- kubectl CLI

### Installation Steps
1. Navigate to the task directory:
   ```bash
   cd task3-kubernetes
   ```

2. Apply the Kubernetes manifests:
   ```bash
   kubectl apply -f manifests/
   ```

3. Verify the deployment:
   ```bash
   kubectl get pods
   kubectl get services
   ```
