# High-Availability Application Deployment Project

## Overview
This project demonstrates a complete deployment pipeline for a Node.js application using various deployment strategies and tools.

## Project Structure 

## Tasks Overview

### [Task 1: Systemd Service Deployment](task1-systemd/README.md)
Implementation of a Node.js application as a systemd service:
- Basic Node.js Express application setup
- Systemd service configuration
- Automated installation script
- System logging with Winston
- Health check endpoints

### [Task 2: Docker-based Deployment](task2-docker/README.md)
Containerized deployment with load balancing:
- Docker container configuration
- Multi-container orchestration with Docker Compose
- Nginx load balancer setup
- Container health monitoring
- Scalable architecture

### [Task 3: Kubernetes Deployment](task3-kubernetes/README.md)
High-availability Kubernetes deployment:
- Kubernetes manifests configuration
- Rolling update strategy
- Resource management and limits
- Health probes implementation
- Load balancing setup

### [Task 4: Troubleshooting](task4-troubleshooting/README.md)
Comprehensive debugging guide:
- Common issues and solutions
- Debugging strategies
- Configuration validation
- Best practices for each deployment method

### [Task 5: Talos Linux](task5-talos/README.md)
Talos Linux cluster setup:
- Control plane configuration
- Worker nodes setup
- Cluster management
- Security hardening
- High-availability configuration

## Prerequisites
- Linux environment
- Node.js and npm
- Docker and Docker Compose
- Kubernetes cluster
- Talos Linux (for Task 5)

## Getting Started
1. Clone the repository
2. Navigate to desired task directory
3. Follow task-specific README instructions

## Documentation
Each task directory contains its own README with detailed instructions and explanations. 