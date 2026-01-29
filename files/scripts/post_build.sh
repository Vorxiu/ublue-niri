#!/usr/bin/env bash

set -oue pipefail

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

sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker