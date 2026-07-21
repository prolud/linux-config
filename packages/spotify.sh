#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable for spotify installation
# it install spotify using the official apt repository

# [STATUS]
# OK!

set -euo pipefail

curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update
sudo apt install spotify-client