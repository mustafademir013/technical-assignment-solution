#!/bin/bash

# Stop script on error
set -e

echo "Starting Node.js application installation..."

# Create required directories
sudo mkdir -p /opt/myapp
sudo mkdir -p /var/log/myapp
sudo mkdir -p /opt/myapp/logs  # Log dizini

# Create system user
sudo useradd -r -s /bin/false myapp || echo "User already exists"

# Install Node.js 20 if not present
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Create package.json
cat > /opt/myapp/package.json << EOF
{
  "name": "myapp",
  "version": "1.0.0",
  "main": "app.js",
  "type": "module",
  "dependencies": {
    "express": "^4.17.1",
    "winston": "^3.3.3"
  }
}
EOF

# Copy application files
sudo cp app.js /opt/myapp/

# Install dependencies
cd /opt/myapp
sudo npm install

# Set permissions
sudo chown -R myapp:myapp /opt/myapp
sudo chown -R myapp:myapp /var/log/myapp

# Copy systemd service file
sudo cp myapp.service /etc/systemd/system/

# Enable and start service
sudo systemctl daemon-reload
sudo systemctl enable myapp
sudo systemctl start myapp

echo "Installation complete. Checking service status..."
sudo systemctl status myapp 