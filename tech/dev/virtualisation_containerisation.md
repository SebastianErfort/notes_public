---
title: Virtualisation and Containerisation
visibility: public
aliases:
  - Virtualisation
  - Containers
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

- [[KVM]]
- [[VirtualBox]]
- [[Vagrant]]
- [[VMware]]
- [[Xen]]

## References

- [OCI: Open Container Initative](https://opencontainers.org/): open governance structure for the express purpose of creating open industry standards around container formats and runtimes
