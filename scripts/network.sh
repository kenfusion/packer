#!/usr/bin/env bash

sed -i '/^GSSAPI/d' /etc/ssh/sshd_config
sed -i 's/#UseDNS yes/UseDNS no/' /etc/ssh/sshd_config
sed -i '/^HWADDR\|^UUID/d' /etc/sysconfig/network-scripts/ifcfg-e*
rm /etc/udev/rules.d/70-persistent-net.rules
rm /lib/udev/rules.d/75-persistent-net-generator.rules
ln -fs /dev/null /lib/udev/rules.d/75-persistent-net-generator.rules
