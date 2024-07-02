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

Type 1 Hypervisors: runs directly on computer's underlying hardware, e.g. VMWare ESXi

- [[KVM]]
- [[esxi]]
- [[hyper-v]]
- [[Proxmox]]
- [[XCP-ng]] and [[Xen]]
- Nutanix AHV

Type 2: runs on top of underlying OS

- [[VirtualBox]]
- [[VMWare]] Fusion, Workstation
- bhyve
- [[qemu]]: emulate hardware, can utilise [[KVM]]

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
