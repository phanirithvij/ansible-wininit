set -x

ANSIBLE_CONFIG=conf/ansible.profile.cfg \
ansible-playbook \
    -i inv/inv.ini \
    plays/play-local.yml $@
