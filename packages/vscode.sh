#!/usr/bin/env bash

set -euo pipefail

echo "==> Removing old VS Code repository configuration..."

sudo find /etc/apt/sources.list.d -type f \
    -exec grep -l "packages.microsoft.com/repos/code" {} + 2>/dev/null \
    | xargs -r sudo rm -f || true

sudo rm -f /usr/share/keyrings/microsoft.gpg
sudo rm -f /etc/apt/keyrings/packages.microsoft.gpg

echo "==> Creating keyrings directory..."
sudo mkdir -p /etc/apt/keyrings

echo "==> Downloading Microsoft GPG key..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | sudo tee /etc/apt/keyrings/packages.microsoft.gpg >/dev/null

sudo chmod 644 /etc/apt/keyrings/packages.microsoft.gpg

echo "==> Adding VS Code repository..."

ARCH=$(dpkg --print-architecture)

echo "deb [arch=${ARCH} signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
    | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null

echo "==> Updating package index..."
sudo apt update

echo "==> Installing Visual Studio Code..."
sudo apt install -y code

echo
echo "VS Code version:"
code --version

echo
echo "Visual Studio Code installed successfully."
