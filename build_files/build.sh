#!/bin/bash

set -ouex pipefail


# rsync -rvK /ctx/system_files/ /

dnf group install audio -y
# dnf group install "Design Suite" -y
dnf install fish zsh -y
dnf install ptyxis kweather kcalc kontact okular skanpage -y
dnf install rclone restic buildah fzf ntfs-3g -y
dnf copr enable ublue-os/packages -y
dnf install ublue-bling ublue-brew ublue-os-just ublue-rebase-helper ublue-os-setup-services ublue-os-update-services uupd -y
dnf copr disable ublue-os/packages -y

dnf remove firefox firefox-langpacks PackageKit PackageKit-command-not-found -y

dnf clean all
