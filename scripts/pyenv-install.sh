#!/bin/bash
set -e
export PATH="$HOME"/.pyenv/bin:"$PATH"

#Install dependencies
sudo yum install -y openssl-devel sqlite-devel bzip2-devel xz-libs tk-devel gdbm-devel ncurses-devel readline-devel xz git patch
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer -o /tmp/pyenv-installer

#Install pyenv
bash /tmp/pyenv-installer
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#Install python 2 and 3
pyenv install 2.7.12
pyenv install 3.5.2

#Set up shell
cat << 'EOF' > "$HOME"/.pyenvrc
export PATH="$HOME"/.pyenv/bin:"$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF

cat << EOF >> "$HOME"/.bash_profile
if [ -f ~/.pyenvrc ]; then
        . ~/.pyenvrc
fi
EOF
