#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1


# repos

dnf config-manager --set-enabled crb  
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm
# dnf -y copr enable ublue-os/packages
# dnf config-manager --add-repo https://pkgs.tailscale.com/stable/rhel/10/tailscale.repo


# desktop

dnf install -y @"KDE Plasma Workspaces"
dnf remove -y xwaylandvideobridge PackageKit
rm -rf /usr/share/plasma/look-and-feel/org.fedoraproject.fedora.desktop
rm -rf /usr/share/wallpapers/fedora

systemctl enable sddm.service

# base

dnf install -y git ptyxis distrobox # ublue-os-udev-rules ublue-brew tailscale

# systemctl enable brew-setup.service
# systemctl enable tailscaled.service

# flatpak

dnf install -y flatpak

mkdir -p /etc/flatpak/remotes.d 
curl -o /etc/flatpak/remotes.d/flathub.flatpakrepo  https://dl.flathub.org/repo/flathub.flatpakrepo

# appimage

dnf install -y fuse





# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket
