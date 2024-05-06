---
title: libvirt
type: software
category:
  - virtualisation
desc-short: libvirt is an open-source API, daemon and management tool for managing platform virtualization. It can be used to manage KVM, Xen, VMware ESXi, QEMU and other virtualization technologies. These APIs are widely used in the orchestration layer of hypervisors in the development of a cloud-based solution.
tags: 
visibility: public
related:
  - "[[qemu]]"
  - "[[KVM]]"
developer: RedHat
source: https://gitlab.com/libvirt/libvirt
url: https://libvirt.org/
img: "![|60](https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Libvirt_logo.svg/1280px-Libvirt_logo.svg.png)"
docs: https://libvirt.org/docs.html
---
# libvirt

`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

<figure>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Libvirt_support.svg/300px-Libvirt_support.svg.png" style="background-color: white;">

<caption>libvirt supports several hypervisors and is supported by several management solutions[^wikipedia]</markdown></caption>
</figure>

## Examples

### libvirt within Docker

See [libvirt in Docker container @Stackoverflow][libvirt-in-docker].

## References

[libvirt-in-docker]: <https://stackoverflow.com/a/76684521>
[^wikipedia]: <https://en.wikipedia.org/wiki/Libvirt>