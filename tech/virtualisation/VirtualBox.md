---
title: Virtual Box
type: software
category: ""
url: ""
docs: ""
source: ""
developer: Oracle
desc-short: |
  ...
tags: [sw/virtualBox]
visibility: public
---
`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

# Oracle VirtualBox

## Guest Additions

Provide improved performance and behaviour of guest machine. Require kernel development packages to be installed in guest system, e.g.

```bash
sudo yum install -y kernel-devel
```

Should be accessible via `Devices > Insert Guest Additions CD Image`. If this fails with a [error about certificates](https://www.virtualbox.org/ticket/20628), download the GuestAddtions manually from `https://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso`. Then add a optical drive in `Settings > Storage` and chose the downloaded ISO. Boot the guest machine and the ISO should be mounted automatically. Start the installation script, see [Manual: Chapter 4. Guest Additions](https://www.virtualbox.org/manual/ch04.html)

```bash
$ sudo sh ./VBoxLinuxAdditions.run
To build modules for other installed kernels, run
VirtualBox Guest Additions:   /sbin/rcvboxadd quicksetup <version>
VirtualBox Guest Additions: or
VirtualBox Guest Additions:   /sbin/rcvboxadd quicksetup all
```

*Update:* `Devices > Upgrade Guest Additions`

## Networking

Capture network traffic to `pcap` file, enable network tracing[^1]

```
# VBoxManage modifyvm [your-vm] --nictrace[adapter-number] on --nictracefile[adapter-number] file.pcap
# VirtualBox -startvm [your-vm]
```

[^1]: <https://www.virtualbox.org/wiki/Network_tips>
