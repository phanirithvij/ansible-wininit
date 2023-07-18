set -x

ANSIBLE_CONFIG=conf/ansible.cfg \
ansible-playbook \
    -i inv/inv.ini \
    plays/play-mitogen.yml $@

ANSIBLE_STRATEGY=mitogen_linear \
ANSIBLE_CONFIG=conf/ansible.mitogen.cfg \
ansible-playbook \
    -i inv/inv.ini \
    plays/play-local.yml $@
