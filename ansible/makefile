ANSIBLE=export ANSIBLE_CONFIG=ansible.cfg &&

HYPERVISER_IP=10.0.0.10
SSH_CMD=ssh -i /home/sam/.ssh/ansible_id-rsa -t ansible@

bootstrap_hyperviser:
	${ANSIBLE} ansible-playbook playbooks/bootstrap_hyperviser.yml -K
setup_hyperviser:
	${ANSIBLE} ansible-playbook playbooks/setup_hyperviser.yml -K

NAS_VMID=100
DISK-ID_0=ata-ST1000LM024_HN-M101MBB_S31QJ9GFB01579
DISK-ID_1=ata-WDC_WD10EALX-759BA0_WD-WCATR7006461
DISK-ID_2=ata-TOSHIBA_MQ04UBF100_42NDT1ANT

add-drives_nas:
#	${SSH_CMD}${HYPERVISER_IP} "ls -n /dev/disk/by-id/"
	${SSH_CMD}${HYPERVISER_IP} "sudo /sbin/qm set ${NAS_VMID} -virtio0 /dev/disk/by-id/${DISK-ID_0}; \
								sudo /sbin/qm set ${NAS_VMID} -virtio1 /dev/disk/by-id/${DISK-ID_1}; \
								sudo /sbin/qm set ${NAS_VMID} -virtio2 /dev/disk/by-id/${DISK-ID_2}"

switch_subnets:
	${ANSIBLE} ansible-playbook playbooks/switch_subnets.yml -K

reboot_server:
	${SSH_CMD}${HYPERVISER_IP} "sudo reboot"

bootstrap_services:
	${ANSIBLE} ansible-playbook playbooks/bootstrap_services.yml -K
setup_services:
	${ANSIBLE} ansible-playbook playbooks/setup_services.yml -K
