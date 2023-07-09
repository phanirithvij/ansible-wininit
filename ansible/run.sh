set -x

#ANSIBLE_KEEP_REMOTE_FILES=True \ # <-- disables pipelining which slows by 2x but useful for understanding ansible internals

ANSIBLE_CONFIG=./ansible.cfg \
ansible-playbook \
    -i inventory.ini \
    local-playbook.yml $@
