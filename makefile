include config.mk

build-server: build-hyperviser build-network build-services

build-hyperviser: 	hyperviser-mesg bootstrap_hyperviser setup_hyperviser create-install_vms add-drives_nas
build-network: 		network-mesg switch_subnets switch_network-cables reboot_server
build-services: 	services-mesg copy_config-files bootstrap_services setup_services

# Target Recipies

## Hyperviser

hyperviser-mesg:
	@echo "Building Hyperviser"

bootstrap_hyperviser:
	${ANSIBLE} ansible-playbook ${PLAYBOOKS}/bootstrap_hyperviser.yml -K
setup_hyperviser:
	${ANSIBLE} ansible-playbook ${PLAYBOOKS}/setup_hyperviser.yml -K

create-install_vms:
	./scripts/create-install_vms_prompt.sh

add-drives_nas:
#	${SSH_CMD}${HYPERVISER_IP} "ls -n /dev/disk/by-id/"
	${SSH_CMD}${HYPERVISER_IP} "sudo /sbin/qm set ${NAS_VMID} -virtio0 /dev/disk/by-id/${DISK-ID_0}; \
								sudo /sbin/qm set ${NAS_VMID} -virtio1 /dev/disk/by-id/${DISK-ID_1}; \
								sudo /sbin/qm set ${NAS_VMID} -virtio2 /dev/disk/by-id/${DISK-ID_2}"

## Network

network-mesg:
	@echo ""
	@echo "Building Network"

switch_subnets:
	${ANSIBLE} ansible-playbook ${PLAYBOOKS}/switch_subnets.yml -K

switch_network-cables:
	@bash -c ' \
		read -p "Switch Network Cables... (Enter)" \
	'

reboot_server:
	${SSH_CMD}${HYPERVISER_IP} "sudo reboot"

## Services

services-mesg:
	@echo ""
	@echo "Building Services"

copy_config-files:
	@bash -c ' \
		read -p "Copy Truenas Scale Config File... (Enter)"; \
		read -p "Copy PfSense Config File... (Enter)"; \
	'

bootstrap_services:
	${ANSIBLE} ansible-playbook ${PLAYBOOKS}/bootstrap_services.yml -K
setup_services:
	${ANSIBLE} ansible-playbook ${PLAYBOOKS}/setup_services.yml -K
