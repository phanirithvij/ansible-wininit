#!/usr/bin/env sh

# Set root passwd
pswd=123
echo -en "$pswd\n$pswd" | passwd

# Install bash and set as default shell
apk update
apk add bash shadow
echo $pswd | chsh -s /bin/bash root
apk del shadow
echo "export PATH=\$PATH:~/.local/bin" > ~/.bashrc
source ~/.bashrc

# Install ansible
#apk add python3 py3-pip
#pip install pipx
#pipx install --include-deps ansible
apk add ansible
which ansible
ansible --version
