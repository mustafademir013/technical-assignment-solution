# Task 4: Troubleshooting and Debugging Guide

## Overview
This task provides comprehensive debugging strategies and solutions for common issues across all deployment methods.

## Common Issues and Solutions

### 1. Systemd Service Issues
- **Problem**: Service fails to start
  - Check logs: `journalctl -u myapp`
  - Verify permissions: `ls -l /opt/myapp`
  - Check Node.js installation

- **Problem**: Logging issues
  - Verify log directory permissions
  - Check disk space
  - Review log rotation settings

### 2. Docker Container Issues
- **Problem**: Container crashes
  - Check logs: `docker logs <container-id>`
  - Review resource limits
  - Verify network settings

- **Problem**: Load balancer issues
  - Check Nginx configuration
  - Verify container health checks
  - Review network connectivity

### 3. Kubernetes Deployment Issues
- **Problem**: Pods not starting
  - Check pod status: `kubectl describe pod <pod-name>`
  - Review resource quotas
  - Verify image pull policy

- **Problem**: Service discovery issues
  - Check service configuration
  - Verify label selectors
  - Review DNS settings

## Debugging Commands

### Systemd Debugging