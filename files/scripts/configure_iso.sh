#!/usr/bin/env bash
set -eoux pipefail

# Remove packages to save space
dnf remove -y google-noto-fonts-all ublue-brew || true


# Disable services not needed in live environment
systemctl disable rpm-ostree-countme.service
systemctl disable tailscaled.service
systemctl disable bootloader-update.service

# Install Anaconda for installation
dnf install -y anaconda-live libblockdev-btrfs

# Create live user account
useradd -m -G wheel -s /usr/bin/zsh liveuser
passwd -d liveuser
chage -d 0 liveuser

# Allow wheel group to use sudo without password
echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel-nopasswd
