#!/usr/bin/env bash
# http://eemyop.blogspot.com/2013/04/gae-on-rhel-63-building-python-27-from.html

set -e

yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel xz-libs tk-devel gdbm-devel ncurses-devel readline-devel xz

cd /tmp

wget -q http://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz

xz -d Python-2.7.9.tar.xz
tar -xf Python-2.7.9.tar
cd Python-2.7.9
./configure --prefix=/usr/local
make
make altinstall

# trying out builtin pip on 2.7.9

/usr/local/bin/python2.7 -m ensurepip

/usr/local/bin/python2.7 -m pip install virtualenv

/usr/local/bin/python2.7 -m pip install virtualenvwrapper

rm -rf /tmp/Python-2.7.9*

cat << EOF >> /home/vagrant/.bash_profile
export WORKON_HOME=\$HOME/.virtualenvs
export PROJECT_HOME=\$HOME/MyProjects
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
source /usr/local/bin/virtualenvwrapper.sh
EOF

