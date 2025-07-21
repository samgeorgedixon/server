# Server Build Steps

- Any Proxmox Network Restart = Restart PfSense VM

## Hyperviser
1. Shell:     make bootstrap_hyperviser (Ansible)
3. Shell:     make setup_hyperviser (Ansible)
4. Web:       Create / Install VM's

## Network
1. Shell:     make switch-subnets (Ansible)
2. Hardware:  Switch Network Cables
3. Shell:     make reboot_server (Ansible)

## Services
2. Web:       Copy Configuration Files
                - Truenas Scale
                - PfSense
1. Shell:     make bootstrap_services (Ansible)
3. Shell:     make setup_services (Ansible)

## Maintenance
1. //Shell:     make maintenance
