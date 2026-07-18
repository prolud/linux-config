#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable for zen browser installation
# it installs zen using the official flatpak image

# [STATUS]
# OK!

set -euo pipefail

sudo flatpak install -y flathub app.zen_browser.zen