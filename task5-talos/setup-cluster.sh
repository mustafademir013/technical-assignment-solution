#!/bin/bash

# Talos cluster setup script
set -e

echo "Starting Talos cluster setup..."

# Control plane node configuration
talosctl apply-config -n 10.0.0.1 -f config/controlplane.yaml

# Wait for control plane to be ready
sleep 30

# Worker nodes configuration
for i in {2..4}; do
  talosctl apply-config -n 10.0.0.$i -f config/worker.yaml
done

# Get kubeconfig
talosctl kubeconfig -n 10.0.0.1

echo "Checking cluster health..."
talosctl cluster health

echo "Cluster setup complete!" 