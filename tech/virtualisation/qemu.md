---
title: QEMU
type: software
category:
  - emulator
url: https://www.qemu.org/
docs: https://www.qemu.org/documentation
source: https://gitlab.com/qemu-project/qemu
developer: "QEMU team: Peter Maydell, et al."
desc: QEMU (Quick Emulator[3]) is a free and open-source emulator. It emulates a computer's processor through dynamic binary translation and provides a set of different hardware and device models for the machine, enabling it to run a variety of guest operating systems. It can interoperate with Kernel-based Virtual Machine (KVM) to run virtual machines at near-native speed. QEMU can also do emulation for user-level processes, allowing applications compiled for one architecture to run on another.[4]QEMU supports the emulation of various architectures, including x86, ARM, PowerPC, RISC-V, and others.
tags:
  - virtualisation/emulation
aliases:
  - Quick Emulator
related:
  - "[[KVM]]"
desc-short: A generic and open source machine emulator and virtualizer
---
# QEMU

`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

- emulation tools and standard virtual hardware: processors, network interfaces, graphics cards, ...
- can be used to create VMs, especially for old or uncommon hardware (ARM, PowerPC, SPARC, ...) but emulation is slow
- if processor supports virtualisation, QEMU can use KVM to directly access the systems hardware with near native performance


## Commands

### Images

`qemu-img`: create and handle images ^qemu-img

```bash
# create disk image (thin provisioning)
qemu-img create <disk image>.qcow2 -f qcow2 100G
qemu-img resize 80G <disk image>.qcow2
qemu-img resize +10G <disk image>.qcow2
# overlay
qemu-img info diskimage.qcow2
qemu-img rebase -b /new/path/backing.qcow2 overlay.qcow2
```

- growing disk: expand filesystem after
- shrinking disk: resize filesystem first
- disk operations are risky - backup!

`qemu-nbd`: mount and inspect images as network storage devices (nbd) that can then be mounted the regular way ^qemu-nbd

```bash
# verify nbd kernel module is loaded
sudo modprobe lbd
# or
lsmod | grep nbd
# connect disk image as nbd
sudo qemu-nbd --conect /dev/nbd0 /path/to/disk.qcow2
sudo mount /dev/nbd0 /mnt/point
# dismountd and isconnect
sudo umount /mnt/point
sudo qemu -d /dev/nbd0
```

### System: create and run VMs

`qemu-system-<architecture>`: create VM

```bash
qemu-system-x86_64 \                     # Create a guest with x86_64 architecture
    -enable-kvm \                        # Use KVM instead of CPU emulation
    -cpu host \                          # Give guest same model CPU as host
    -smp 4 \                             # 4 cores, symmetric/shared-memory multiprocessing[^smp]
    -m 4096 \                            # provide the VM 4GB of RAM
    -k en-us \                           # keyboard layout
    -vnc :0 \                            # make display available at port 5900 on host
    -drive file=<disk image>,if=virtio \ # use a file for the system's hard disk with paravirtualisation
    -cdrom <iso image> \                 # present disk image as CD-ROM
    -boot d \                            # boot from CD-ROM device
    -usbdevice table                     # improve mousing
```

- CPU architecture: SMP[^SMP] or [^numa]
- Access display through VNC viewer remote desktop viewer. `0` refers to last digit of port `5900`, use `1`, `2` and so forth for higher ports in case of multiple guests ^vnc
- boot device (letters from DOS)
    - `d`: CD-ROM device
    - `c`: first hard drive
- after installation, start machine by dropping last 2 arguments to boot from disk
- verify guest system hardware, e.g. with

    ```bash
    # General info
    hostnamectl
    # Output
    # Virtualization: kvm
    # CPU info
    lscpu
    # device info
    lspci
    # usb info
    lsusb
    # memory info
    lsmem
    ```

- monitor and debug with option `-monitor stdio`, enter `help` for available commands
    - `change_vnc_password` together with `-vnc :0,password=on`
    - `system_powerdown`


## Display

Use [[#^vnc|VNC as described above]] or if guest has GUI, local video can be used alternatively, providing much improved performance.

`-display` options: GTK, SDL, VNC, curses, none

```bash
qemu-system \
    -display gtk \
    -vga std \
    ...
# -display
#   none : attach no dispoolay (still has a video card that can be connected to)
# curses : text-based console, not suitable for GUI
# vnc    : over network, flexible but poor performance
# sdl    : Simple DirectMedia Layer (local graphical window) suitable for non-Linux hosts
# gtk    : GNOME ToolKit (local graphical window)
#   gtk and sdl support OpenGL with ,gl=on
#
# -vga
#  std   : standard, moderate resolutions, low VRAM
```


## Storage and File Sharing

See [[#Images]] for creating and inter-operating with disk image files.
 
File-sharing between guest and host: [Plan 9 Filesystem Protocol (9P)][qemu-9p]

```bash
qemu-system-x86_64 \
    ...
    -virtfs local,path=$PWD/shared,mount_tag=shared,security_model=mapped
    # local: other options exist but are more for developing/testing
    # security_model=mapped : short for mapped xattr, file ownership derived from user running guest
```

On guest mount with

```bash
# use mount_tag previously defined with qemu
sudo mount -t 9p -o trans=virtio $mount_tag $mount_point -o version=9p2000.L
```

Check extended attributes on host with `getfattr -d shared/file.txt`.


## Devices

Host hardware can be passed through to guest.

### USB

- v1.1, v2 or v3 (using xHCI if supported)
- option `-usbdevice` uses USB 1.1
- set up bus and connect device
  
    ```bash
    # find usb device on host: bus, device/port, vendor id, product id
    lsusb
    # Create guest bus and connect device:
    # Accessing host USB devices requires root or setting up udev for user.
    # NOTE: -display gtk did not work for me with sudo (missing display permissions?), used -vnc :0 for this
    sudo qemu-system \
        ... \
        -vnc :0 \
        -device qemu-xhci,id=xhci \
        -device usb-host,bus=xhci.0,vendorid=0x$vendorid,productid=0x$productid
    # or access USB port (bus and device in lsusb output)
        -device usb-host,bus=xhci.0,hostbus=1,hostport=5
    ```

- if device is unplugged/not plugged in, QEMU keeps checking for it
- to make device available to host again, guest has to be shut down

## References

[^numa]: See [[public/tech/glossary#^numa|glossary]]
[^smp]: See [[public/tech/glossary#^smp|glossary]]
[qemu-9p]: <https://wiki.qemu.org/Documentation/9p>
