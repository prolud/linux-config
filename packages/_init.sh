#!/usr/bin/bash

# [DESCRIPTION]
# this file is responsable configure the initial bash run command
# it copies the bashrc from this repository to the user's home directory and substitutes the default bashrc

# [STATUS]
# OK!

mkdir -p ~/.bashrc.d
cp -f ./config/bashrc.sh ~/.bashrc.d/_init.sh

cat > ~/.bashrc <<'EOF'
# loads all bashrc.d scripts
for file in ~/.bashrc.d/*.sh; do
    [ -r "$file" ] && source "$file"
done
EOF

source ~/.bashrc