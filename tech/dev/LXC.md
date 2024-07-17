---
title: LXC
type: software
category:
  - container
tags:
  - dev/containerisation
url: "https://linuxcontainers.org/lxc"
docs: "https://linuxcontainers.org/lxc/documentation/"
source: "https://github.com/lxc/lxc"
visibility: public
aliases:
  - Linux Containers
desc-short: Linux Containers (LXC) is an operating-system-level virtualization method for running multiple isolated Linux systems (containers) on a control host using a single Linux kernel.
---
# Linux Containers (LXC)

`= ("[Website](" + this.url + ")")` | `= ("[Documentation](" + this.docs + ")")` | `= ("[Source](" + this.source + ")")`

## LXD

Daemon acting as hypervisor

```bash
sudo lxd init
```

and go through setup process
 
 - LXD clustering: connect multiple LXD instances on network
 - storage pool: required for images etc.
 - `no` to using empty partition/disk will create loop device
 - [MaaS (Metal as a Service) server](https://maas.io/): infrastructure management tool
 - network bridge: required to give containers network access


## LXC

```bash
sudo lxc launch <image>[:<version>]
sudo lxc exec <container name> /bin/bash # or other shell
sudo lxc list # show container info/status
```


## Config

1. Default Configuration Directory: `/etc/lxc/lxc.conf`
2. Container-Specific Configuration Files: `/var/lib/lxc/my-container/config`
3. User Containers (Unprivileged Containers): `~/.local/share/lxc/my-container/config`


## Images

- sources are called *remote*

```bash
lxc remote list
```

## References

[wikipedia]: <https://en.wikipedia.org/wiki/LXC>