#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable for mongodb compass installation
# it adds sourcegit to the apt sources then installs it

# [STATUS]
# OK!

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

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
echo "Version:"
mongodb-compass --version