---
visibility: public
title: ISO And Boot Media
---
Script to extract `vmlinuz` and `initrd` from an iso image:

```bash
iso=${1:-jammy-live-server-amd64.iso}

for path in /casper/vmlinuz /casper/initrd ; do
    isoinfo -R -i "$iso" -x $path >${path##*/}
done
```

## Bootable media

### Ventoy

[Website](https://www.ventoy.net/en/index.html) | [Github](https://github.com/ventoy/Ventoy)
Best tool so far that I found is Ventoy. It creates two partitions on a USB disk, one contains the Ventoy software and on the other you can put your ISOs, even multiple! Upon boot from the disk you then get a menu to choose an image.

- supports secure boot
- just drop your ISOs in the correct partition, no need to wipe and re-partition
- Ventoy on your removable media can be updated in place with the software
- distros can easily be made [persistent](https://www.ventoy.net/en/plugin_persistence.html), such that changes to the live image are preserved through reboot
