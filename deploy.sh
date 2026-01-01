#!/bin/bash

# Hugo Blog Deployment Script for Hetzner via SFTP
#
# Usage: ./deploy.sh
#
# Before running this script, set the following environment variables:
# - SFTP_HOST: Your Hetzner server hostname or IP
# - SFTP_USER: Your SFTP username
# - SFTP_PASSWORD: Your SFTP password
# - SFTP_REMOTE_PATH: The remote directory path (e.g., /var/www/html)
#
# You can also create a .env file with these variables:
# SFTP_HOST=your-server.com
# SFTP_USER=your-username
# SFTP_PASSWORD=your-password
# SFTP_REMOTE_PATH=/var/www/html

set -e

# Load environment variables from .env file if it exists
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

# Check if required environment variables are set
if [ -z "$SFTP_HOST" ] || [ -z "$SFTP_USER" ] || [ -z "$SFTP_REMOTE_PATH" ]; then
    echo "Error: Missing required environment variables"
    echo "Please set: SFTP_HOST, SFTP_USER, SFTP_PASSWORD, SFTP_REMOTE_PATH"
    echo ""
    echo "You can create a .env file with:"
    echo "SFTP_HOST=your-server.com"
    echo "SFTP_USER=your-username"
    echo "SFTP_PASSWORD=your-password"
    echo "SFTP_REMOTE_PATH=/var/www/html"
    exit 1
fi

# Prompt for password if not set
if [ -z "$SFTP_PASSWORD" ]; then
    echo -n "Enter SFTP password: "
    read -s SFTP_PASSWORD
    echo
fi

echo "Building Hugo site..."
hugo

echo "Deploying to $SFTP_HOST via SFTP..."

# Use lftp for SFTP deployment
lftp sftp://$SFTP_HOST <<EOF
set sftp:auto-confirm yes
user "$SFTP_USER" "$SFTP_PASSWORD"
mirror --reverse --delete --verbose public/ $SFTP_REMOTE_PATH/
bye
EOF

echo "Deployment complete!"
