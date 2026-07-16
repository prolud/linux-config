#!/usr/bin/env bash

set -euo pipefail

VERSION="1.49.12"
PACKAGE="mongodb-compass_${VERSION}_amd64.deb"
URL="https://downloads.mongodb.com/compass/${PACKAGE}"

echo "==> Downloading MongoDB Compass ${VERSION}..."
wget -q --show-progress "$URL"

echo "==> Installing MongoDB Compass..."
sudo apt update
sudo apt install -y "./${PACKAGE}"

echo "==> Cleaning up..."
rm -f "$PACKAGE"

echo
echo "MongoDB Compass has been installed successfully."
echo
echo "Version:"
mongodb-compass --version