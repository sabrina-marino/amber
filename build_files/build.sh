#!/bin/bash

set -ouex pipefail


# rsync -rvK /ctx/system_files/ /

# dnf5 copr enable ycollet/audinux -y
# dnf5 install LinVst -y
# dnf5 copr disable ycollet/audinux -y
dnf5 install realtime-setup -y
dnf5 install python3-legacy-cgi -y # raysession dependency
dnf5 group install audio -y
dnf5 remove rakarrack -y # this one doesn't work
#dnf5 group install "Design Suite" -y
dnf5 install fish zsh -y
dnf5 install gwenview ptyxis kweather kcalc okular skanpage vlc -y
dnf5 install fastfetch rclone restic buildah fzf ntfs-3g -y
dnf5 copr enable ublue-os/packages -y
dnf5 install ublue-bling ublue-brew ublue-os-just ublue-rebase-helper ublue-setup-services ublue-os-update-services uupd -y
dnf5 copr disable ublue-os/packages -y
dnf5 remove firefox firefox-langpacks -y
dnf5 clean all
