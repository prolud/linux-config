#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable for mongodb compass installation
# it adds sourcegit to the apt sources then installs it

# [STATUS]
# OK!

set -euo pipefail

INSTALL_DIR="$HOME/.dotnet"

VERSIONS=(
  "6.0.428"
  "8.0.423"
  "9.0.316"
  "10.0.302"
)

mkdir -p "$INSTALL_DIR"

for VERSION in "${VERSIONS[@]}"; do
    if "$INSTALL_DIR/dotnet" --list-sdks 2>/dev/null | grep -q "^${VERSION} "; then
        echo "SDK ${VERSION} already instaled."
        continue
    fi

    FILE="dotnet-sdk-${VERSION}-linux-x64.tar.gz"
    URL="https://builds.dotnet.microsoft.com/dotnet/Sdk/${VERSION}/${FILE}"

    echo "Installing SDK ${VERSION}..."

    wget -q --show-progress "$URL" -O "/tmp/$FILE"

    echo "Extracting..."
    tar -xzf "/tmp/$FILE" -C "$INSTALL_DIR"

    rm "/tmp/$FILE"

    mkdir -p ~/.config/zsh
done

cat > ~/.config/zsh/conf.d/dotnet.zsh <<'EOF'
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"
EOF

echo
echo "Installed SDKs."
"$INSTALL_DIR/dotnet" --list-sdks