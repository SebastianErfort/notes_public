---
title: Proxmox
date: 2024-06-20
type: software
category:
  - hypervisor/type1
url: https://www.proxmox.com/en/
docs: https://www.proxmox.com/en/services/support#support-resources
source: https://github.com/proxmox
desc-short: |
  Proxmox Virtual Environment is a virtualisation platform designed for the provisioning of hyper-converged infrastructure. Proxmox allows deployment and management of virtual machines and containers. It is based on a modified Ubuntu LTS kernel. Two types of virtualization are supported: container-based with LXC, and full virtualization with KVM.
tags:
  - hypervisor
related: &related
  - "[[esxi|ESXi]]"
  - "[[hyper-v|Hyper-V]]"
same: *related
---
> [!warning] No updates without subscription!?

# Proxmox

`= ("[Website](" + this.url + ")")` | `= ("[Documentation](" + this.docs + ")")` | `= ("[Source](" + this.source + ")")`

`= ("> " + this.desc-short)`

## Features

- type 1 hypervisor
- based on [[Debian|Debian Linux]]
- can run VMs and containers
- Proxmox VE can be used for free, updates and support require subscription
- instances can be combined to enable advanced features such as virtual storage and networking, high availability features
- managed through command line or web interface
- manage LVM, ZFS, Ceph storage
- virtual networks and network devices


## Config

- access management webinterface through ip+port provided, default `<ip>:8006`
- upload ISO
- create VM using ISO
- show and download pre-configured container images through Proxmox console: server, client and special-purpose images (`turnkey`)
  
    ```bash
    # list container images
    pveam available
    # download image
  pveam download local <image name>
    ```

- create container: button  <button type='button'>Create CT</button>


## References

- [Pihole in LXC container][pihole-lxc]

[pihole-lxc]: <https://www.datahoards.com/installing-pi-hole-inside-a-proxmox-lxc-container/>
