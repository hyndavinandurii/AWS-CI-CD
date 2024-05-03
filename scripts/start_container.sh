#!/bin/bash
set -e

# Update the apt package index
sudo apt update

# Install packages to allow apt to use a repository over HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the apt package index (again) after adding Docker repository
sudo apt update

# Install Docker CE
sudo apt install -y docker-ce

# Add the current user to the docker group to run Docker commands without sudo
sudo usermod -aG docker $USER

# Start the Docker service
sudo systemctl start docker

# Enable Docker to start on boot
sudo systemctl enable docker

# Pull the Docker image from Docker Hub
docker pull venkatahyndavi/hotel-app:latest

# Run the Docker image as a container
docker run -dit -p 80:80 venkatahyndavi/hotel-app
