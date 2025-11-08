#!/bin/bash

set -ouex pipefail


# dnf group install "Common NetworkManager submodules" "Fonts" "Hardware Support" "Printing Client" -y

# dnf config-manager --add-repo=https://negativo17.org/repos/epel-multimedia.repo
# dnf config-manager --set-disabled epel-multimedia
# dnf install --enablerepo=epel-multimedia ffmpeg libavcodec @multimedia gstreamer1-plugins-{bad-free,bad-free-libs,good,base} lame{,-libs} libjxl ffmpegthumbnailer -y


dnf install distrobox fastfetch git restic buildah -y
dnf install gwenview kweather kate kcalc kontact okular skanpage -y # haruna
dnf install fish -y

# chsh -s /usr/bin/fish

dnf copr enable ublue-os/packages -y
dnf install ublue-brew ublue-os-udev-rules -y
dnf install ublue-polkit-rules ublue-os-just ublue-os-update-services ublue-setup-services uupd ublue-bling ublue-rebase-helper -y
dnf copr disable ublue-os/packages -y

systemctl enable brew-setup.service
systemctl disable mcelog.service
systemctl --global enable podman-auto-update.timer
systemctl disable rpm-ostree.service
systemctl enable ublue-system-setup.service
systemctl enable uupd.timer
systemctl --global enable ublue-user-setup.service
systemctl mask bootc-fetch-apply-updates.timer bootc-fetch-apply-updates.service
authselect enable-feature with-fingerprint
# systemctl enable systemd-resolved.service



dnf clean all


# systemctl enable fwupd.service
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket
