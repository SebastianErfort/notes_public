---
title: Btrfs
docs: "https://btrfs.readthedocs.io/en/latest/index.html"
type: os
category:
  - filesystem
---
# Btrfs

`= ("[Documentation](" + this.docs + ")")`

```bash
# filesystem
mkfs.btrfs <device>
# fs label
btrfs filesystem label [<device>|<mount_point>] [<newlabel>]
btrfs filesystem show [options] [<path>|<uuid>|<device>|label]
mount LABEL=<label> -o compress <mount_point>
# subvolumes
btrfs subvolume create [options] [<dest>/]<name>
mount LABEL=<label> -o subvol=<name>
```
## References

[wikipedia]: <https://en.wikipedia.org/wiki/Btrfs>
[archi-wiki]: <https://wiki.archlinux.org/title/Btrfs>