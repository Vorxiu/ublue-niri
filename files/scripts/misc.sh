#!/usr/bin/env bash
set -euo pipefail

# create /nix partition
# mkdir -p /nix

echo "test"
# install bbrew
# brew install Valkyrie00/homebrew-bbrew/bbrew

git clone --depth=1 https://github.com/mda-dev/noctalia-sddm-theme.git /usr/share/sddm/themes/noctalia

git clone --depth=1 https://gitlab.com/Matt.Jolly/sddm-eucalyptus-drop.git /usr/share/sddm/themes/eucalyptus-drop