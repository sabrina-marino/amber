#!/bin/bash

set -ouex pipefail

dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
dnf group install -y "KDE Plasma Workspaces"
systemctl set-default graphical
systemctl enable sddm
dnf install -y flatpak git distrobox fuse
dnf install -y centos-release-kmods
dnf config-manager --set-enabled kmods
dnf install -y btrfs-progs


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
