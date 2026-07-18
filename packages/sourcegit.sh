#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable for sourcegit installation
# it adds sourcegit to the apt sources then installs it

# [STATUS]
# OK!

set -euo pipefail
sudo mkdir -p /etc/apt/keyrings
curl https://codeberg.org/api/packages/yataro/debian/repository.key | sudo tee /etc/apt/keyrings/sourcegit.asc
echo "deb [signed-by=/etc/apt/keyrings/sourcegit.asc, arch=amd64,arm64] https://codeberg.org/api/packages/yataro/debian generic main" | sudo tee /etc/apt/sources.list.d/sourcegit.list
sudo apt update
sudo apt install sourcegit