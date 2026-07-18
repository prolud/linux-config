#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable for zed installation
# it install zed using the official install script

# [STATUS]
# OK!

set -euo pipefail

curl -f https://zed.dev/install.sh | sh

cat > ~/.bashrc.d/zed.sh << 'EOF'
export PATH="$HOME/.local/zed.app/bin:$PATH"
EOF