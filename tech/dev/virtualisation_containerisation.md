---
title: Virtualisation and Containerisation
visibility: public
aliases:
  - Virtualisation
  - Containers
  - Hypervisors
related:
  - "[[containerisation]]"
  - "[[virtualisation]]"
---
## Hardware

Determine CPU virtualisation support

```bash
lscpu | grep Virtualization
egrep "svm|vmx" /proc/cpuinfo
```

## Hypervisors

Classification

- type 1: runs directly on computer's underlying hardware, e.g. VMWare ESXi
- type 2: runs on top of underlying OS, e.g. VMWare Fusion

Type 1 Hypervisors

- [[KVM]]
- [[Proxmox]]
- [[hyper-v]]
- [[esxi]]
- [[XCP-ng]] and [[Xen]]
- Nutanix AHV

Type 2

- [[VirtualBox]]
- [[VMWare]] Fusion, Workstation
- bhyve


## Containerisation

### [[dev/Docker|Docker]]

### [[LXC]]


## Orchestration

- [[Vagrant]]
- [[libvirt]]
- [[public/tech/dev/Kubernetes|Kubernetes]]
- [[public/tech/dev/Podman|Podman]]


## References

- [OCI: Open Container Initative](https://opencontainers.org/): open governance structure for the express purpose of creating open industry standards around container formats and runtimes


## Images

- [OpenStack image guide](https://docs.openstack.org/image-guide/obtain-images.html)
