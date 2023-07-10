set -x

ANSIBLE_CONFIG=conf/ansible.cfg \
ansible-playbook \
    -i inv/inv.ini \
    plays/play-dev.yml $@

set +x
for f in $(ls plays/*.yml);
do
	echo ansible-lint $f
	ANSIBLE_CONFIG=conf/ansible.cfg \
	ansible-lint \
	    $f $@
done
