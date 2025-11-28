#!/bin/bash

set -ouex pipefail


# rsync -rvK /ctx/system_files/ /

# dnf copr enable ycollet/audinux -y
# dnf install LinVst -y
# dnf copr disable ycollet/audinux -y
# dnf install realtime-setup -y
# dnf install python3-legacy-cgi -y # raysession dependency
# dnf group install audio -y
# dnf remove rakarrack -y # this one doesn't work
# dnf group install "Design Suite" -y
dnf install fish zsh -y
dnf copr enable atim/starship -y
dnf install starship -y
dnf copr disable atim/starship -y
dnf install gwenview ptyxis kweather kcalc okular skanpage vlc -y
dnf install fastfetch rclone restic -y
dnf copr enable ublue-os/packages -y
dnf install ublue-bling ublue-brew ublue-os-just ublue-rebase-helper ublue-setup-services ublue-os-update-services uupd -y
dnf copr disable ublue-os/packages -y
dnf remove firefox firefox-langpacks -y
dnf clean all
