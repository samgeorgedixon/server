export 
ANSIBLE=export ANSIBLE_CONFIG=ansible.cfg &&

bootstrap_hyperviser:
	${ANSIBLE} ansible-playbook playbooks/bootstrap_hyperviser.yml -K
setup_hyperviser:
	${ANSIBLE} ansible-playbook playbooks/setup_hyperviser.yml -K

bootstrap_services:
	ansible-playbook playbooks/bootstrap_services.yml -K
setup_services:
	ansible-playbook playbooks/setup_services.yml -K
