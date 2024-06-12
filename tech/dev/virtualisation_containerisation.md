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

Hypervisors

- [[KVM]]
- [[VirtualBox]]
- [[VMware]]
- [[Xen]]


## Containerisation

### [[dev/Docker|Docker]]

### [[LXC]]


## Orchestration

- [[Vagrant]]
- [[libvirt]]

## References

- [OCI: Open Container Initative](https://opencontainers.org/): open governance structure for the express purpose of creating open industry standards around container formats and runtimes
