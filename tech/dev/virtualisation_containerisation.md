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

- AMD: `AMD-V`
- Intel: `VT-x`

    *Paravirtualisation (VirtIO)*: provides more direct access to host's memory, storage, GPU and other devices for improved performance. Guest is aware of virtualisation.


## Hypervisors

Type 1: runs directly on computer's underlying hardware

- [[KVM]]
- [[vsphere]]
- [[hyper-v]]
- [[Proxmox]]
- [[XCP-ng]] and [[Xen]]
- Nutanix AHV

Type 2: runs on top of underlying OS

- [[VirtualBox]]
- [[VMWare]] Fusion, Workstation
- [[bhyve]]
- [[qemu]]: emulate hardware, can utilise [[KVM]]


## Containerisation

- protected spaces, self-contained
- share host's kernel
- portable and flexible
- created from file system images
- optimized to run a service/application without additional software

Container applications

- [[dev/Docker|Docker]]
- [[LXC]]


## Virtualisation

- [[KVM]]
- [[QEMU]]


## Orchestration

- [[public/tech/dev/Vagrant]]
- [[libvirt]]
- [[public/tech/dev/Kubernetes|Kubernetes]]
- [[public/tech/dev/Podman|Podman]]


## Operation

- display
    - VNC (virtual network connection): easy, but not very fast or secure way to connect to display


## Storage

### Disk Image Files

Formats

- raw
- QCOW2 (QEMU copy-on-write): snapshots, sparse files


### Overlay

Common scenario: use immutable read-only disk image with multiple guests and individual overlayed images to save space.

- over extended period of time, updates and other changes can lead to great deviation between overlay and backing image

## References

- [OCI: Open Container Initative](https://opencontainers.org/): open governance structure for the express purpose of creating open industry standards around container formats and runtimes


## Images

- [OpenStack image guide](https://docs.openstack.org/image-guide/obtain-images.html)
