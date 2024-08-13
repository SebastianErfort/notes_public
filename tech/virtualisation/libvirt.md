---
title: libvirt
type: software
category:
  - virtualisation
desc-short: libvirt is an open-source API, daemon and management tool for managing platform virtualization. It can be used to manage KVM, Xen, VMware ESXi, QEMU and other virtualization technologies. These APIs are widely used in the orchestration layer of hypervisors in the development of a cloud-based solution.
tags: ""
visibility: public
related:
  - "[[qemu]]"
  - "[[kvm]]"
developer: RedHat
source: "https://gitlab.com/libvirt/libvirt"
url: "https://libvirt.org/"
img: "![|60](https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Libvirt_logo.svg/1280px-Libvirt_logo.svg.png)"
docs: "https://libvirt.org/docs.html"
---
# libvirt

`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

<figure>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Libvirt_support.svg/300px-Libvirt_support.svg.png" style="background-color: white;">

<caption>libvirt supports several hypervisors and is supported by several management solutions[^wikipedia]</markdown></caption>
</figure>


- APIs communicate e.g. with [[QEMU]]
- central management for disk images and snapshots
- config files
    - `/etc/libvirt/qemu.conf`


## Configuration

### User Mode

1. add user to system group`libvirt` (create if missing) and specify socket in commands with `--connection qemu:///session` or by setting environment variable `LIBVIRT_DEFAULT_URI=qemu:///session`
2. adjust group and permissions for socket in `/etc/libvirt/libvirtd.conf` (comments state that these changes are ignored when using systemd socket activation ❓❗)

    ```toml
    unix_sock_group = "libvirt"
    unix_sock_r0_perms = "0770"
    unix_sock_rw_perms = "0770"
    ```

3. restart service

    ```bash
    sudo systemctl restart libvirtd.service
    ```

## Networking

Libvirt creates a bridge to provide a NAT network with default IP range `192.168.122.x`.


## Tools

### virsh

[Libvirt documentation: virsh](https://libvirt.org/manpages/virsh.html)

```bash
# interactive mode
virsh
help
list [--all] # list VMs
edit <name> # edit XML
```

### Virtual Machine Manager

- package name `virt-managaer`


## Examples

### libvirt within Docker

See [libvirt in Docker container @Stackoverflow][libvirt-in-docker].

## References

- [RedHat guide: Lab with KVM and libvirt][redhat-kvm-libvirt]

[libvirt-in-docker]: <https://stackoverflow.com/a/76684521>
[redhat-kvm-libvirt]: <https://www.redhat.com/sysadmin/build-lab-quickly>
