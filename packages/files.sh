#!/usr/bin/bash

# [DESCRIPTION]
# this file just copy some personal images to the Pictures directory
# it adds my profile picture and wallpapers folder

# [STATUS]
# OK!

set -euo pipefail

cp -r ./pictures/me ~/Pictures/
cp -r ./pictures/wallpapers ~/Pictures/