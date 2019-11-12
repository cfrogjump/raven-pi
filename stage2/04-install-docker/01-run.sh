#!/bin/bash -e

install -m 644 files/docker.list	"${ROOTFS_DIR}/etc/apt/sources.list.d/docker.list"
install -m 644 files/docker.gpg "${ROOTFS_DIR}/etc/docker.gpg"

on_chroot << EOF
wget https://download.docker.com/linux/raspbian/gpg
cat ./gpg | apt-key add -

if [[ -e /etc/docker.gpg ]]; then
  echo "docker.gpg file exists"
fi

apt-get update
apt-get install -y -qq --no-install-recommends docker-ce docker.io docker-compose
usermod -aG docker pi
EOF
