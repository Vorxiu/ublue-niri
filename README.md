# ublue-niri &nbsp; [![bluebuild build badge](https://github.com/vorxiu/ublue-niri/actions/workflows/build.yml/badge.svg)](https://github.com/vorxiu/ublue-niri/actions/workflows/build.yml)

A base niri image with some sane minimal configs.
  
## Features

- Minimal configs for most tools
- ntsync enabled
- Systemd services for swayidle,swaybg,keyring,polkit
- [udev rules](https://github.com/Vorxiu/ublue-niri/blob/main/files/system/etc/udev/rules.d/99-batify-wayland.rules) for low battery notifications and some system sounds(battery,devices)
- [osd](https://github.com/Vorxiu/ublue-niri/blob/main/files/system/usr/bin/mako-osd) using libnotify
- sddm with breeze theme
- hyprlock
- docker and distrobox
- JetBrainsMonoNerd Font
- zsh configured with p10k some plugins

Full package list [here](https://github.com/Vorxiu/ublue-niri/blob/main/recipes/recipe.yml)


## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/vorxiu/ublue-niri:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/vorxiu/ublue-niri:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/vorxiu/ublue-niri
```

## TODO

- [x] udev rules for system sounds (plug/unplug)
- [x] pleasant sddm theme using (where is my sddm theme)
- [x] nicer lockscreen (hyprlock?)
- [x] papirus-icon-theme and add gschema overrides in the config
- [x] ntsync
- [x] sddm with breeze
- [X] bake some vscode extensions into the iso
- [] bbrew?
- [] Fix: Swaybg not automatically starting via systemD
- [] hyprlock not reading the config from /etc/hypr/hyprlock
- [] ISO for easy installation
