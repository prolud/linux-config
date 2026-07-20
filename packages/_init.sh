#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable configure the initial bash run command
# it copies the bashrc from this repository to the user's home directory and substitutes the default bashrc

# [STATUS]
# OK!

set -euo pipefail

mkdir -p ~/.bashrc.d
mkdir -p ~/.profile.d
cp -f ./config/bashrc.sh ~/.bashrc.d/_init.sh

cat > ~/.bashrc <<'EOF'
# loads all bashrc.d scripts
for file in ~/.bashrc.d/*.sh; do
    [ -r "$file" ] && source "$file"
done
EOF

cat > ~/.profile <<'EOF'
# loads all profile.d scripts
for file in ~/.profile.d/*.sh; do
    [ -r "$file" ] && source "$file"
done
EOF

source ~/.bashrc