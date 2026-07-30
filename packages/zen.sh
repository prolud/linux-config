#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable for zen browser installation
# it installs zen using the latest official release

# [STATUS]
# OK!

#!/usr/bin/env bash

set -euo pipefail

URL="https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz"

TMP_DIR="$(mktemp -d)"
INSTALL_DIR="/opt/zen"
BIN_LINK="/usr/local/bin/zen"

cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT

echo "Baixando Zen Browser..."
curl -L "$URL" -o "$TMP_DIR/zen.tar.xz"

echo "Extraindo..."
tar -xf "$TMP_DIR/zen.tar.xz" -C "$TMP_DIR"

echo "Instalando..."
sudo rm -rf "$INSTALL_DIR"
sudo mv "$TMP_DIR/zen" "$INSTALL_DIR"

echo "Criando link simbólico..."
sudo ln -sf "$INSTALL_DIR/zen" "$BIN_LINK"

echo "Criando atalho no menu..."

sudo tee /usr/share/applications/zen.desktop >/dev/null <<EOF
[Desktop Entry]
Version=1.0
Name=Zen Browser
Comment=Zen Browser
Exec=$INSTALL_DIR/zen %u
Terminal=false
Type=Application
Icon=$INSTALL_DIR/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
StartupNotify=true
EOF

echo "Instalação concluída."
echo "Execute com:"
echo "  zen"