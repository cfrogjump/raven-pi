#!/bin/bash -e

on_chroot << EOF
curl -k -sSL https://get.docker.com | sh
EOF
