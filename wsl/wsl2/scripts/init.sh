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
# Also ansible is too slow
#apk add python3 py3-pip
#pip install pipx
#pipx install --system-site-packages --include-deps ansible
apk add ansible
echo $(which ansible) --version
$(which ansible) --version
mkdir -p /etc/ansible
cat > /etc/ansible/ansible.cfg << EOF
[defaults]
# Use the YAML callback plugin.
stdout_callback = yaml
# Use the stdout_callback when running ad-hoc commands.
bin_ansible_callbacks = True
log_path = ~/.cache/ansible-playbook.log
# https://stackoverflow.com/a/68496361
[ssh_connection]
pipelining = True
ssh_args = -o ControlMaster=auto -o ControlPersist=1200
EOF

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

# Optional tools which are to be made into ansible notebooks or roles or whatnot

# lf setup (TODO copy config file from github yadm/chezmoi/dotdrop/...)
apk add lf
mkdir -p ~/.config/lf
echo "set hidden!" > ~/.config/lf/lfrc

# https://github.com/denisidoro/navi/blob/master/docs/config_file.md
# navi setup (default config comes with skim, zsh, overwrite it with the example one which is fzf, bash)
apk add fzf navi
navi info config-example > $(navi info config-path)
echo "navi widget bash > /tmp/navi_widget.sh" >> ~/.bashrc
echo "source /tmp/navi_widget.sh" >> ~/.bashrc

# TODO fish shell
#apk add fish # this is auto installing navi, lf, fzf fish plugins
