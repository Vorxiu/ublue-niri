#!/usr/bin/env bash

set -oue pipefail
# create /nix partition
mkdir -p /nix

# some code extensions
ext install ms-vscode-remote.remote-containers
dnf install qalculate meson libtool cairo-devel rofi-devel
git clone https://github.com/svenstaro/rofi-calc.git
cd rofi-calc/
meson setup build
meson compile -C build/
meson install

# cleanup
dnf remove -y meson libtool cairo-devel rofi-devel
cd ..
rm -rf rofi-calc

