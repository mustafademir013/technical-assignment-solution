# Task 1: Systemd Service Deployment

## Overview
This task implements a Node.js Express application as a systemd service with comprehensive logging and monitoring capabilities.

## Components
### app.js
- Express.js web server
- Health check endpoint
- Winston logging integration
- Automatic log directory creation

### myapp.service
- Systemd service configuration
- Automatic restart on failure
- Log output redirection
- Environment configuration

### setup.sh
- Automated installation script
- System user creation
- Dependencies installation
- Service deployment

## Deployment Steps

### Prerequisites
- Linux system with systemd
- Node.js (v16 or higher)
- npm
- Root or sudo access

### Installation Steps

1. Navigate to the task directory:
   ```bash
   cd task1-systemd
   ```

2. Prepare the environment:
   ```bash
   chmod +x setup.sh
   ```

3. Run the installation script:
   ```bash
   sudo ./setup.sh
   ```

4. Verify the service status:
   ```bash
   sudo systemctl status myapp
   ```

5. Test the application:
   ```bash
   curl http://localhost:5000/health
   ```