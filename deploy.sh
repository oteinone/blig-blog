#!/bin/bash

# Hugo Blog Deployment Script for Hetzner via SFTP
#
# Usage: ./deploy.sh
#
# Before running this script, set the following environment variables:
# - SFTP_HOST: Your Hetzner server hostname or IP
# - SFTP_USER: Your SFTP username
# - SFTP_REMOTE_PATH: The remote directory path (e.g., /var/www/html)
#
# You can also create a .env file with these variables:
# SFTP_HOST=your-server.com
# SFTP_USER=your-username
# SFTP_REMOTE_PATH=/var/www/html

set -e

# Load environment variables from .env file if it exists
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Check if required environment variables are set
if [ -z "$SFTP_HOST" ] || [ -z "$SFTP_USER" ] || [ -z "$SFTP_REMOTE_PATH" ]; then
    echo "Error: Missing required environment variables"
    echo "Please set: SFTP_HOST, SFTP_USER, SFTP_REMOTE_PATH"
    echo ""
    echo "You can create a .env file with:"
    echo "SFTP_HOST=your-server.com"
    echo "SFTP_USER=your-username"
    echo "SFTP_REMOTE_PATH=/var/www/html"
    exit 1
fi

echo "Building Hugo site..."
hugo

echo "Deploying to $SFTP_HOST..."

# Create SFTP batch file
cat > /tmp/sftp_commands.txt << EOF
cd $SFTP_REMOTE_PATH
put -r public/*
bye
EOF

# Upload files via SFTP
sftp -b /tmp/sftp_commands.txt $SFTP_USER@$SFTP_HOST

# Clean up
rm /tmp/sftp_commands.txt

echo "Deployment complete!"
