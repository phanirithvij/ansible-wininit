#!/usr/bin/env sh

rm -f /etc/motd

# If shell is ash, change it
if [[ $SHELL == *"/ash" ]]; then
	# Set root passwd
	pswd=123
	echo -en "$pswd\n$pswd" | passwd
	# Install bash and set as default shell
	apk update
	apk add bash shadow
	echo $pswd | chsh -s /bin/bash root
	echo
	apk del shadow
fi

cat > ~/.profile << EOF
if [ -n "\$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "\$HOME/.bashrc" ]; then
        . "\$HOME/.bashrc"
    fi
fi
EOF

# TODO Install ansible via pipx
# This has a libyaml issue which is requiring a source build
# And that build requires a shit ton of time and so far hasn't succeded
# Installing alpine package for now
# Also ansible is too slow try with mitogen or rust rewrite incorporating mitogen principles (herculean task)
# apk add python3 py3-pip
# pip install pipx
# pipx install --system-site-packages --include-deps ansible
# TODO temp downgrade for mitogen
apk add ansible
# apk add ansible-core=2.13.6-r0 ansible=6.6.0-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/v3.17/community
mkdir -p ~/.cache
echo $(which ansible) --version
$(which ansible) --version
mkdir -p /etc/ansible
cp ../../ansible/ansible.cfg /etc/ansible/ansible.cfg
# ansible-galaxy collection install community.general
apk add py3-pip
pip install mitogen
apk del py3-pip

# setup ssh
apk add openssh tmux py3-pip
ssh-keygen -A
chmod go-w /var/empty
cp ./scripts/sshd_config /etc/ssh/sshd_config
mkdir -p ~/.ssh
chmod 700 ~/.ssh

pip install tmuxp
rm -rf ~/.cache/pip
apk del py3-pip

echo "tmuxp load -d ${PWD}/scripts/ssh_t.yml" >> ~/.bashrc
# run sshd with tmux
source ~/.bashrc
