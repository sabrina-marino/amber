#!/bin/bash

set -ouex pipefail
dnf group install "Base" "Core" "Standard" --allowerasing -y
dnf install dnf-plugins-core -y
dnf config-manager --set-enabled crb
dnf install epel-release -y
dnf config-manager --set-enabled epel
dnf group install "KDE Plasma Workspaces" -y
systemctl enable sddm
systemctl set-default graphical.target
dnf install flatpak git distrobox fuse -y


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket
