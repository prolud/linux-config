#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable for nvm installation
# it was genereted by chatgpt XD

# [STATUS]
# OK!

set -euo pipefail

echo "Installing NVM..."

curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash

NVM_DIR="${HOME}/.nvm"

### Writing config file:\
mkdir -p ~/.bashrc.d
cat > ~/.bashrc.d/nvm.sh <<'EOF'
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
EOF

echo "NVM installation completed."
echo
echo "Restart your terminal or run:"
echo "source ~/.bashrc"

