#!/bin/bash
# EC2 User-Data script to install Python, deploy app, and run it.

set -e

# Install system updates and required tools
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip awscli

# Configure variables
S3_BUCKET_NAME="dositejcvetkovicdemobucket"
ARTIFACT_NAME="web-app.tar.gz"

# Install application dependencies
pip3 install fastapi uvicorn requests

# Download the application artifact from S3
aws s3 cp s3://${S3_BUCKET_NAME}/${ARTIFACT_NAME} /home/ubuntu/
tar -xzvf /home/ubuntu/${ARTIFACT_NAME} -C /home/ubuntu/

# Run FastAPI application
cd /home/ubuntu/
nohup python3 -m uvicorn app.main:app --host 0.0.0.0 --port 8000 > /dev/null 2>&1 &