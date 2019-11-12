#!/bin/bash -e

install -m 644 files/docker.list	"${ROOTFS_DIR}/etc/apt/sources.list.d/docker.list"
install -m 644 files/docker.gpg "${ROOTFS_DIR}/etc/docker.gpg"

on_chroot << EOF
cat /etc/docker/docker.gpg | apt-key add -qq -

apt-get update
apt-get install -y -qq --no-install-recommends docker-ce
usermod -aG docker pi
EOF
