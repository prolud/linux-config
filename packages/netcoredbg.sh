#!/usr/bin/env bash

# [DESCRIPTION]
# this file is responsable for netcoredbg debugger for dotnet
# it installs by official github release 

# [STATUS]
# OK!

set -euo pipefail

VERSION="3.2.0-1092"
URL="https://github.com/Samsung/netcoredbg/releases/download/${VERSION}/netcoredbg-linux-amd64.tar.gz"

INSTALL_DIR="/opt/netcoredbg"
BIN_LINK="/usr/local/bin/netcoredbg"

echo "==> Baixando NetCoreDbg ${VERSION}..."

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

curl -L "$URL" -o "$TMP_DIR/netcoredbg.tar.gz"

echo "==> Instalando em ${INSTALL_DIR}..."

sudo rm -rf "$INSTALL_DIR"
sudo mkdir -p "$INSTALL_DIR"

sudo tar -xzf "$TMP_DIR/netcoredbg.tar.gz" -C "$INSTALL_DIR"

echo "==> Criando link simbólico..."

sudo ln -sf "$INSTALL_DIR/netcoredbg" "$BIN_LINK"

echo "==> Verificando instalação..."

if command -v netcoredbg >/dev/null 2>&1; then
    netcoredbg --buildinfo
    echo
    echo "NetCoreDbg instalado com sucesso."
else
    echo "Falha ao instalar o NetCoreDbg."
    exit 1
fi