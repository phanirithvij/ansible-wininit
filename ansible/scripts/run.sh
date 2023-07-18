set -x

ANSIBLE_CONFIG=conf/ansible.cfg \
ansible-playbook \
    -i inv/inv.ini \
    plays/play-local.yml $@
