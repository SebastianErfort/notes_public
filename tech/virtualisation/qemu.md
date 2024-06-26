---
title: QEMU
type: software
category:
  - emulator
url: "https://www.qemu.org/"
docs: "https://www.qemu.org/documentation"
source: "https://gitlab.com/qemu-project/qemu"
developer: "QEMU team:Peter Maydell, et al."
desc: QEMU (Quick Emulator[3]) is a free and open-source emulator. It emulates a computer's processor through dynamic binary translation and provides a set of different hardware and device models for the machine, enabling it to run a variety of guest operating systems. It can interoperate with Kernel-based Virtual Machine (KVM) to run virtual machines at near-native speed. QEMU can also do emulation for user-level processes, allowing applications compiled for one architecture to run on another.[4]QEMU supports the emulation of various architectures, including x86, ARM, PowerPC, RISC-V, and others.
tags: ""
aliases:
  - Quick Emulator
related:
  - "[[KVM]]"
desc-short: A generic and open source machine emulator and virtualizer
---
# `=this.title`

`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

- emulation tools and standard virtual hardware: processors, network interfaces, graphics cards, ...
- can be used to create VMs, especially for old or uncommon hardware (ARM, PowerPC, SPARC, ...) but emulation is slow
- if processor supports virtualisation, QEMU can use KVM to directly access the systems hardware with near native performance


## Tools

`qemu-img`: create images

```bash
# create disk image (thin provisioning)
qemu-img create <disk image>.qcow2 -f qcow2 100G
```

`qemu-system-<architecture>`: create VM

```bash
qemu-system-x86_64 \
  -cpu host -smp 4 \                   # simulate host processor model and provide 4 cores
  -enable-kvm \                        # enable use of KVM for virtualisation
  -m 4096 \                            # provide the VM 4GB of RAM
  -k en-us \                           # keyboard layout
  -vnc :0 \                            # make display available at port 5900 on host
  -drive file=<disk image>,if=virtio \ # use a file for the system's hard disk
  -cdrom <iso image> \                 # present disk image as CD-ROM
  -boot d \                            # boot from disk
```

- after installation, start machine by dropping last 2 lines.
- access display through VNC viewer remote desktop viewer