#!/usr/bin/env bash

set -euo pipefail

echo "==> Removing old VS Code repository configuration..."
grep -rl "packages.microsoft.com/repos/code" /etc/apt/sources.list.d 2>/dev/null \
    | xargs -r sudo rm -f

sudo rm -f /usr/share/keyrings/microsoft.gpg
sudo rm -f /etc/apt/keyrings/packages.microsoft.gpg

echo "==> Creating keyrings directory..."
sudo mkdir -p /etc/apt/keyrings

echo "==> Downloading Microsoft GPG key..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | sudo tee /etc/apt/keyrings/packages.microsoft.gpg >/dev/null

echo "==> Adding VS Code repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
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