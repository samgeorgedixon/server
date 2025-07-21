# Server Designs

## Goals
- Central Control
  - Centralised logs
  - Monitoring

- Security
  - HTTPS / SSL
  - Strong Passwords
  - SSH Keys
  - Disable Root (admin)
  - Strict Firewalls (ufw)
  - Everything through Reverse Proxy
  - Limit Permissions
  - File / Folder Permisions
  - Restrict SSH
  - Log Monitoring (fail2ban)
  - Auditing

- Reliablility
  - Shutdown Correctly
  - Backups
    - Working Drive
    - All Backed up to NAS
    - NAS Backed up to Cloud
  - Debian Linux
  - DHCP with Static Mappings
  - Monitoring

- Documentation (Ansible + Steps)

## Services
- NAS (Truenas Scale)
- Router (Pfsense)
- Reverse Proxy (Nginx Proxy Manager)
- Hyperviser (Proxmox)
- Docker (Lazy Docker / Portainer)
- Web Server
- Monitoring / Logs (Granfana)
- Compute
- DNS Server (bind9)
- VPN Server (OpenVPN Pfsense)
- Photos Server (Immich)
- Dashboard (Glance / Homarr / Homer)
- Kubernetes
- Caching - DNS / Web

## Structure
- Server: (Hyperviser - Proxmox)
  - VM's:
    - Router (Pfsense)
      - VPN Server (OpenVPN)
    - NAS (Truenas Scale)
    - DNS Server (bind9)
    - Web Server
    - Compute
  - Docker: (Lazy Docker / Portainer)
    - Dashboard (Glance / Homarr / Homer)
    - Reverse Proxy (Nginx Proxy Manager)
    - Photos Server (Immich)
    - Monitoring (Granfana)

## Ansible Steps
1. Setup Hyperviser (Proxmox)
  - OS
    - Update
    - Basic Apps
    - Users (admin, ansible, sam / Disable root)
    - Limit Permissions
    - SSH (Keys / Restrictions)
    - Firewall
  - Drives
  - Download ISO's
  - VM's
2. Services / Network
  - OS's
  - Network (Hardware + Software)
3. Setup / Maintenance
  - OS's (Again for Maintenance)
  - Services
  - Updates

## Build Steps
1. Setup Hyperviser:
  - Bootstrap(Ansible)
  - Add "admin" User to Proxmox
  - Setup OS (Ansible)
  - Setup Proxmox:
    - Download ISO's: debian, truenas_scale, pfsense,
    - Create VM's
  - Docker (Ansible)
    - Dashboard (Glance / Homarr / Homer)
    - Reverse Proxy (Nginx Proxy Manager)
    - Photos Server (Immich)
    - Monitoring (Granfana)
2. Configure Services:
  - Install VM's
  - Bootstrap + Setup OS's (Ansible)
  - Configure:
    - PfSense (Configuration File)
    - Truenas Scale (Configuration File)
    - Bind9 (Ansible)
3. Network
  - Configure Network (Ansible)
  - Switch Network (Hardware)
4. Maintenance (Ansible)

## VM's
1. TrueNAS Scale
  - Name:       nas
  - VMID:       100
  - Boot Start: true
  - ISO:        truenas_scale.iso
  - Qemu Agent: true
  - Disk Size:  32 GiB
  - Cores:      2
  - Memory:     8192 Mib

2. Pfsense
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
    - Enable SSH

2. Bind9
  - Name:       dns
  - VMID:       110
  - Boot Start: true
  - ISO:        debian.iso
  - Qemu Agent: true
  - Disk Size:  16 GiB
  - Cores:      2
  - Memory:     2048 Mibs

## Hardware
1. Server
  - Hostname:   server
  - CPU:        4 Core - 3.2GHz (Intel i5-4590)
  - Memory:     24 GB
  - Drives:
    - 2 TB HDD - SATA (Boot)
    - 1 TB HDD - SATA (Data Raid)
    - 1 TB HDD - SATA/USB (Data Raid)
    - 1 TB HDD - USB (Data Raid)

2. Desktop
  - Hostname:   desktop-sam
  - Drives:
    - 256 GB SSD (Boot: C)
    - 2 TB HDD:
      - 1 TB Part (Data: D)
      - 1 TB Part (Programs: E)

3. HP Switch
  - Hostname:   switch-hp
  - Ports:
    - VLAN 1:
      - 1-23: Untagged
      - 24:   Excluded
    - VLAN 90:
      - 1-22: Excluded
      - 23:   Tagged
      - 24:   Untagged

4. WAP
5. ISP Router

## Hardware Current
1. Server
  - Hostname:   server-0
  - CPU:        4 Core - 3.2GHz (Intel i5-4590)
  - Memory:     24 GB
  - Drives:
    - 500 GB HDD - SATA (Boot)
    - 1 TB HDD - SATA (Data Raid)
    - 1 TB HDD - USB (Data Raid)
    - 1 TB HDD - USB (Data Raid)

2. Desktop
  - Hostname:   sam-desktop
  - CPU:        4 Core - 3.2GHz (Intel i5-6500)
  - Memory:     8 GB
  - Drives:
    - 256 GB SSD - SATA (Boot: C)
    - 2 TB HDD - USB (Programs: D)

3. HP Switch
