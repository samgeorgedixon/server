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

- Documentation (Ansible)

## Services
- NAS (Truenas Scale)
- Router (Pfsense)
- Reverse Proxy (Nginx Proxy Manager)
- Hyperviser (Proxmox)
- Docker (Lazy Docker / Portainer)
- Web Server
- Monitoring (Granfana)
- Compute
- DNS Server (bind9)
- VPN Server (OpenVPN Pfsense)
- Photos Server (Immich)
- Dashboard (Glance / Homarr / Homer)

## Structure
- Server: (Hyperviser - Proxmox)
  - VM's:
    - Router (Pfsense)
      - VPN Server (OpenVPN)
    - NAS (Truenas Scale)
    - DNS Server (bind9)
    - Photos Server (Immich)
    - Web Server
    - Compute
    - Monitoring (Granfana)
  - Docker: (Lazy Docker / Portainer)
    - Dashboard (Glance / Homarr / Homer)
    - Reverse Proxy (Nginx Proxy Manager)

## Ansible

### Steps
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
    - .
3. Setup / Maintenance
  - OS's (Again for Maintenance)
  - Services
    - .
  - Updates
