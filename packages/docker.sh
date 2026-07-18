#!/usr/bin/env bash

set -euo pipefail

echo "==> Removing old Docker packages..."
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    sudo apt remove -y "$pkg" >/dev/null 2>&1 || true
done

echo "==> Creating keyrings directory..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "==> Downloading Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "==> Adding Docker repository..."

UBUNTU_CODENAME=$(
    . /etc/os-release
    echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}"
)

echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
$UBUNTU_CODENAME stable" \
| sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

echo "==> Updating package index..."
sudo apt update

echo "==> Installing Docker Engine..."
sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

echo "==> Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "==> Adding '$USER' to the docker group..."
sudo usermod -aG docker "$USER"

echo
echo "Docker has been installed successfully."
echo
echo "Docker version:"
docker --version