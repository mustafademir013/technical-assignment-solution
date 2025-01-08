# Task 5: Talos Linux Configuration

## Overview
This task implements a secure Kubernetes cluster using Talos Linux, focusing on high availability and security.

## Components
### controlplane.yaml
- Control plane configuration
- Security settings
- Network configuration
- Certificate management
- Kubelet configuration

### worker.yaml
- Worker node configuration
- Network settings
- Cluster membership
- Security hardening

### setup-cluster.sh
- Automated cluster setup
- Node configuration
- Health verification
- Kubeconfig management

## Installation Steps
### Prerequisites
- Talos Linux ISO
- talosctl CLI

### Installation Steps
1. Navigate to the task directory:
   ```bash
   cd task5-talos
   ```

2. Configure the control plane:
   ```bash
   talosctl apply-config -n <control-plane-ip> -f config/controlplane.yaml
   ```

3. Configure worker nodes:
   ```bash
   for i in {2..4}; do
       talosctl apply-config -n 10.0.0.$i -f config/worker.yaml
   done
   ```

4. Verify the cluster health:
   ```bash
   talosctl cluster health
   ```