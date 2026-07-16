#!/usr/bin/env bash

set -euo pipefail

echo "Installing Oh My Zsh..."

OH_MY_ZSH_DIR="${HOME}/.oh-my-zsh"

if [[ ! -d "$OH_MY_ZSH_DIR" ]]; then
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$OH_MY_ZSH_DIR"
else
    echo "Oh My Zsh is already installed."
fi

echo "Installing Powerlevel10k..."

git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    "${OH_MY_ZSH_DIR}/custom/themes/powerlevel10k" 2>/dev/null || true

echo "Installing zsh-autosuggestions..."

git clone --depth=1 \
    https://github.com/zsh-users/zsh-autosuggestions \
    "${OH_MY_ZSH_DIR}/custom/plugins/zsh-autosuggestions" 2>/dev/null || true

echo "Installing zsh-syntax-highlighting..."

git clone --depth=1 \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "${OH_MY_ZSH_DIR}/custom/plugins/zsh-syntax-highlighting" 2>/dev/null || true

mkdir -p "$HOME/.config/zsh/conf.d"

cat > "$HOME/.config/zsh/conf.d/00-oh-my-zsh.zsh" <<'EOF'
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
EOF

echo
echo "Oh My Zsh installation completed."