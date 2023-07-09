set -x

#ANSIBLE_KEEP_REMOTE_FILES=True \ # <-- disables pipelining which slows by 2x but useful for understanding ansible internals

ANSIBLE_CONFIG=conf/ansible.cfg \
ansible-playbook \
    -i inv/inv.ini \
    plays/play-local.yml $@
