# Task 4: Debugging and Troubleshooting Guide

## Task Description
In this task, we focus on identifying and resolving common issues that may arise in systemd services and Kubernetes Deployments. The goal is to understand the errors, diagnose them effectively, and develop possible solutions.

## Overview
This task includes solutions for common issues with systemd services and Kubernetes Deployments.

## Systemd Service Troubleshooting

### Common Issues and Solutions
1. Service Not Starting
   - Check status with `systemctl status service-name`
   - Check journal logs: `journalctl -u service-name`
   - Verify permissions

2. Dependency Errors
   - Check `After=` and `Requires=` settings in the unit file
   - Ensure dependent services are running

### Additional Issues and Solutions
- Configuration File Errors  
  Inspect the unit file for syntax or permission problems. Remember to run `sudo systemctl daemon-reload` after making corrections.

## Kubernetes Deployment Troubleshooting

### Checklist
1. Pod Status
   ```bash
   kubectl get pods
   kubectl describe pod <pod-name>
   ```

2. Log Examination
   ```bash
   kubectl logs <pod-name>
   kubectl logs <pod-name> --previous
   ```

### Additional Issues and Solutions
- Incorrect Image or Tag  
  Verify that the image or version specified in the Deployment is correct. If it is wrong, update to the correct image and redeploy.

## Sample Troubleshooting Log

### Issue Description
[Describe the encountered issue here]

### Actions Taken
1. [First thing checked]
2. [Changes made]
3. [Outcome]

### Solution
[Final steps that resolved the issue]

## Common Troubleshooting Scenarios

### Systemd Scenarios

#### Scenario 1: Service Fails to Start
**Issue:** Service immediately exits after starting
**Troubleshooting Steps:**
1. Check service status:
   ```bash
   systemctl status myapp.service
   ```
2. View detailed logs:
   ```bash
   journalctl -u myapp.service -n 50
   ```
3. Common causes:
   - Incorrect working directory
   - Missing dependencies
   - Permission issues

#### Scenario 2: Service Crashes Under Load
**Issue:** Service runs but fails during heavy usage
**Steps:**
1. Check resource limits in unit file
2. Monitor system resources:
   ```bash
   top
   free -m
   df -h
   ```

### Kubernetes Scenarios

#### Scenario 1: Pod in CrashLoopBackOff
**Issue:** Pod repeatedly crashes and restarts
**Steps:**
1. Check pod status:
   ```bash
   kubectl describe pod <pod-name>
   ```
2. Review recent logs:
   ```bash
   kubectl logs <pod-name> --previous
   ```
3. Common causes:
   - Missing ConfigMaps/Secrets
   - Incorrect environment variables
   - Application crashes

#### Scenario 2: Pod Stuck in Pending
**Issue:** Pod won't schedule on any node
**Steps:**
1. Check node resources:
   ```bash
   kubectl describe nodes
   ```
2. Verify pod requirements:
   ```bash
   kubectl describe pod <pod-name>
   ```
3. Common causes:
   - Insufficient cluster resources
   - Node selector/affinity issues
   - PVC binding problems

#### Scenario 3: Network Connectivity Issues
**Issue:** Pods can't communicate
**Steps:**
1. Test network connectivity:
   ```bash
   kubectl exec -it <pod-name> -- ping <service-name>
   ```
2. Check service definition:
   ```bash
   kubectl describe svc <service-name>
   ```
3. Verify network policies:
   ```bash
   kubectl get networkpolicies
   ```

### Best Practices
1. Always check logs first
2. Use descriptive commands to gather more information
3. Start with the simplest possible cause
4. Document all changes made
5. Keep configuration files in version control