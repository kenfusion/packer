#!/usr/bin/env bash
# http://eemyop.blogspot.com/2013/04/gae-on-rhel-63-building-python-27-from.html

set -e

yum install -y openssl-devel sqlite-devel bzip2-devel xz-libs tk-devel gdbm-devel ncurses-devel readline-devel xz

cd /tmp

wget -q https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tar.xz

xz -d Python-2.7.11.tar.xz
tar -xf Python-2.7.11.tar
cd Python-2.7.11
./configure --prefix=/home/vagrant/.local
make
make altinstall

/home/vagrant/.local/bin/python2.7 -m ensurepip --upgrade
/home/vagrant/.local/bin/python2.7 -m pip install --upgrade pip
/home/vagrant/.local/bin/python2.7 -m pip install virtualenvwrapper

rm -rf /tmp/Python-2.7.11*

mkdir /home/vagrant/{develop,.virtualenvs}
chown -R vagrant:vagrant /home/vagrant/{develop,.virtualenvs,.local}

sed -i 's\bin\.local/bin\' /home/vagrant/.bash_profile
cat << EOF >> /home/vagrant/.bash_profile
export WORKON_HOME=\$HOME/.virtualenvs
export PROJECT_HOME=\$HOME/develop
export VIRTUALENVWRAPPER_PYTHON=\$HOME/.local/bin/python2.7
source \$HOME/.local/bin/virtualenvwrapper.sh
EOF

