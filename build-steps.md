# Server Build Steps

## Hyperviser
1. Shell:     make bootstrap_hyperviser (Ansible)
3. Shell:     make setup_hyperviser (Ansible)
4. Web:       Create / Install VM's

## Services
1. Shell:     make bootstrap_services (Ansible)
2. Shell:     make setup_services (Ansible)
3. Web:       Copy Configuration Files
                - Truenas Scale
                - PfSense
4. //Shell:     make setup_network (Ansible)
5. Hardware:  Switch Network Cables

## Maintenance
1. //Shell:     make maintenance
