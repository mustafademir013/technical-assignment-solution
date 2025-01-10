#!/bin/bash

# Stop script on error
set -e

echo "Starting Node.js application installation..."

initial_dir=$(pwd)

# Function to install curl
install_curl() {
    echo "Curl not found. Installing curl..."
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y curl
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y curl
    elif command -v yum &> /dev/null; then
        sudo yum install -y curl
    elif command -v pacman &> /dev/null; then
        sudo pacman -Sy curl
    elif command -v zypper &> /dev/null; then
        # openSUSE için
        sudo zypper install -y curl
    elif command -v apk &> /dev/null; then
        # Alpine Linux için
        sudo apk add curl
    else
        echo "Paket yöneticisi bulunamadı. Lütfen curl'u manuel olarak yükleyin."
        exit 1
    fi
}

# Function to install Node.js
install_node() {
    if command -v apt-get &> /dev/null; then
        # Debian/Ubuntu için
        curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
        sudo apt-get install -y nodejs
    elif command -v dnf &> /dev/null; then
        # Fedora için
        curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
        sudo dnf install -y nodejs
    elif command -v yum &> /dev/null; then
        # CentOS/RHEL için
        curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
        sudo yum install -y nodejs
    elif command -v pacman &> /dev/null; then
        # Arch Linux için
        sudo pacman -Syu nodejs npm
    elif command -v zypper &> /dev/null; then
        # openSUSE için
        sudo zypper install -y nodejs20
    elif command -v apk &> /dev/null; then
        # Alpine Linux için
        sudo apk add nodejs npm
    else
        echo "Desteklenmeyen paket yöneticisi. Lütfen Node.js'i manuel olarak yükleyin."
        exit 1
    fi
}

# Check and install curl if not present
if ! command -v curl &> /dev/null; then
    install_curl
fi

# Create required directories
sudo mkdir -p /opt/myapp
sudo mkdir -p /var/log/myapp
sudo mkdir -p /opt/myapp/logs  # Log dizini

# Create system user
sudo useradd -r -s /bin/false myapp || echo "User already exists"

# Install Node.js
if ! command -v node &> /dev/null; then
    install_node
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

# Return initial dir
cd "$initial_dir"
# Copy systemd service file
sudo cp myapp.service /etc/systemd/system/

# Enable and start service
sudo systemctl daemon-reload
sudo systemctl enable myapp
sudo systemctl start myapp

echo "Installation complete. Checking service status..."
sudo systemctl status myapp 