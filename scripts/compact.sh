#!/usr/bin/env bash

#TODO Pass OS type to this script
apt-get clean || yum clean all

rm -rf /tmp/*
dd if=/dev/zero of=/ZERO bs=1M
rm -f /ZERO

sync
