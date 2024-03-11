---
visibility: public
title: Virtualisation
---
# Virtualization

Determine CPU virtualisation support

```bash
lscpu | grep Virtualization
egrep "svm|vmx" /proc/cpuinfo
```

## Hypervisors

- [[KVM]]
- [[Vagrant]]
-  [[VirtualBox]]
- [[VMware]]
