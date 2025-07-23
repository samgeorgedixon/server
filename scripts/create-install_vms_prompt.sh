#!/bin/bash

echo "Create / Install VMs (Web):
  1. NAS
    - Name:       nas
    - VMID:       100
    - Boot Start: true
    - ISO:        truenas_scale.iso
    - Qemu Agent: true
    - Disk Size:  32 GiB
    - Cores:      2
    - Memory:     8192 Mib"
read -p "  - Have you Created / Installed this... (Enter)"

echo "
  2. Router
    - Name:       router
    - VMID:       105
    - Boot Start: true
    - ISO:        pfsense.iso
    - Qemu Agent: true
    - Disk Size:  16 GiB
    - Cores:      2
    - Memory:     4096 Mibs
    - Linux Vlan: vmbr0.90
    - Network:
      - net0:     bridge=vmbr0
      - net1:     bridge=vmbr0, tag=90
    - Installer:
      - WAN:      vtnet0, dhcp
      - LAN:      vtnet1, static, 192.168.1.1/24
      - FileSys:  ZFS, GPT
      - Version:  Current Stable
    - Boot Install:
      - WAN:      vtnet1
      - LAN:      vtnet0
        - DHCP:   10.100.0.1 - 10.100.255.254, dns=1.1.1.1
      - Enable SSH"
read -p "  - Have you Created / Installed this... (Enter)"

echo "
  3. DNS
    - Name:       dns
    - VMID:       110
    - Boot Start: true
    - ISO:        debian.iso
    - Qemu Agent: true
    - Disk Size:  16 GiB
    - Cores:      2
    - Memory:     2048 Mibs
    - Installer:
      - Hostname: dns
        - Domain: server.lan
      - User:     ansible
      - Disk:     Guided Entire Disk
      - Mirror:   yes
      - Software: Only: System, SSH"
read -p "  - Have you Created / Installed this... (Enter)"

echo "
  3. Docker
    - Name:       docker
    - VMID:       115
    - Boot Start: true
    - ISO:        debian.iso
    - Qemu Agent: true
    - Disk Size:  32 GiB
    - Cores:      2
    - Memory:     8192 Mibs
    - Installer:
      - Hostname: docker
        - Domain: server.lan
      - User:     ansible
      - Disk:     Guided Entire Disk
      - Mirror:   yes
      - Software: Only: System, SSH"
read -p "  - Have you Created / Installed this... (Enter)"
