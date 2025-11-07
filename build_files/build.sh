#!/bin/bash

set -ouex pipefail
dnf remove subscription-manager -y
dnf install borgbackup distrobox fastfetch fish fwupd git ptyxis restic tmux zsh -y #rclone bazaar -y

dnf copr enable ublue-os/packages -y
dnf install ublue-brew ublue-os-udev-rules -y
dnf copr disable ublue-os/packages -y
dnf clean all

systemctl enable brew-setup.service
systemctl enable fwupd.service
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket
