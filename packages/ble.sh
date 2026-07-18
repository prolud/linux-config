#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable configure the initial bash run command
# it copies the bashrc from this repository to the user's home directory and substitutes the default bashrc

# [STATUS]
# OK!

curl -L https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
bash ble-nightly/ble.sh --install ~/.local/share

cat > ~/.bashrc.d/ble.sh <<'EOF'
# loads ble.sh
source -- ~/.local/share/blesh/ble.sh

# configure alt + backspace to kill word
bind '"\e\177": backward-kill-word'

# configure suggestion background to transparent
ble-face -s auto_complete fg=242
EOF

rm -rf ble-nightly