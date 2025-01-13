#!/bin/bash

# Define the S3 bucket path and the destination file path
S3_BUCKET_PATH="s3://ssl-certs-2004/build_2025-01-08/EU_Jar/my-java-project-1.0-SNAPSHOT.jar"
DEST_DIR="/home/ec2-user/ebs/java"

# Create the destination directory if it doesn't exist
mkdir -p $DEST_DIR

# Use the AWS CLI to copy the JAR file from S3 to the destination
echo "Downloading JAR file from S3..."
aws s3 cp $S3_BUCKET_PATH $DEST_DIR/app.jar

# Check if the download was successful
if [ $? -eq 0 ]; then
  echo "JAR file downloaded successfully."
else
  echo "Failed to download JAR file."
  exit 1
fi
