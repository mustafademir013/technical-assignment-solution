# Task 2: Docker-based Deployment

## Overview
This task containerizes the Node.js application and implements load balancing using Docker Compose and Nginx.

## Components
### Dockerfile
- Node.js application containerization
- Multi-stage build process
- Health check configuration
- Security considerations

### docker-compose.yml
- Multi-container orchestration
- Service scaling configuration
- Network setup
- Volume management

### nginx.conf
- Load balancer configuration
- Proxy settings
- Health check integration
- SSL/TLS setup (optional)

## Deployment Steps
### Prerequisites
- Docker
- Docker Compose

### Installation Steps
1. Navigate to the task directory:
   ```bash
   cd task2-docker
   ```

2. Build and start services:
   ```bash
   docker-compose up -d --build
   ```

3. Scale the application (if needed):
   ```bash
   docker-compose up -d --scale app=3
   ```

4. Verify the application:
   ```bash
   curl http://localhost/health
   ```