set -x

#ANSIBLE_KEEP_REMOTE_FILES=True \ # <-- disables pipelining which slows by 2x but useful for understanding ansible internals

ANSIBLE_CONFIG=/etc/ansible/ansible.cfg \
ansible-playbook \
    -i inventory.ini \
    -v \
    playbook.yml
