#!/bin/bash -e

on_chroot << EOF
curl -k -sSL http://get.docker.com | sh
EOF
