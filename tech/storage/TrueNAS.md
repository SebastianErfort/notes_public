---
title: TrueNAS
aliases:
  - FreeNAS
  - TrueNAS CORE
---
# TrueNAS CORE

(formerly FreeNAS)

- runs directly on machine like type 1 hypervisors
- network-attached storage (NAS) capabilities
- based on FreeBSD
- create ZFS resources for redundant storage
- access primarily through web interface
- configure disk and storage pools
- shared data with SMB, AFP and NFS
- local users or bind to directory server
- run VMs, containers and jails
- includes bhyve (type 2 hypervisor)
- containers: runs RancherOS VM with containers within

Installation

- ideally OS on RAID 1 or similar of SSDs
- add storage groups; ZFS pools need more than one disk