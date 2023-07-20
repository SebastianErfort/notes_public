---
title: Partitions, File Systems and Swap
tags: Linux
visibility: public
---
- Partitioning: [linuxconfig.org](https://linuxconfig.org/how-to-label-hard-drive-partition-under-linux) | `parted` | `fdisk` | `lsblk` | `sgdisk` (GPT)
    - File systems: `mkfs`, `mkswap`
        - exFAT
          - package `exfat-utils` contains `mkfs.exfat` and `exfatlabel`
          - on Ubuntu/Debian package `exfat-fuse`
        - swap (not really a file system)
          - partition: `mkswap [-L label] /dev/...`
          - file: create sparse file (didn't work for me 2023-02-16), see [[linux#^e79fc2|sparse files]], or create dummy with `dd if=/dev/zero of=/swap.img bs=1M count=4000` and then `mkswap /swap.img`
      - Partition types:
        - [Wikipedia](https://en.wikipedia.org/wiki/Partition_type): [GUIDs](https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs)
        - [pt-mbr-partnames.h](file://journal/life/tech/linux/pt-mbr-partnames.h) from [util-linux package (lsblk)](https://github.com/util-linux/util-linux) (doesn't always match output of `parted` 🤦‍♂️)
        - `fdisk`: chose `l` to print partition types (depending on partition table type MBR or GPT)
- file systems
  - FUSE
    - [CVMFS](https://wiki.gentoo.org/wiki/CVMFS): FUSE module which implements a HTTP read-only file system
  - labels
      - MS-DOS labels: `mlabel -i /dev/...  LABEL` (didn't work as intended for FAT partition)
      - ext: `e2label /dev/... lblname`
      - NTFS: `ntfslabel device [label]`
      - FAT: `(ex)fatlabel device [label]`
- Mounting
  - [Bind mount explained @StackExchange](https://unix.stackexchange.com/a/198591/247791)
- Tools and commands
  - `lsblk`
  - `parted`
      - only one to show free disk sectors: `# parted /dev/xxx print free`
      - unit only works with specifying a disk 🤦‍♂️
      - when letting parted align partitions for better performance (`-a optimal`) specify start/end in `M`
      - can be used in scripts like `parted -s /dev/sda mklabel msdos mkpart primary ntfs 1M 100G mkpart primary ntfs 102400M 102912M mkpart primary 102912M`
  - `fdisk`
  - `sgdisk`: for example helpful to wipe partition tables via `sgdisk --zap-all /dev/name`
  - Allocate file of given size ^e79fc2
      ```bash
      fallocate -l 10G file.img # best choice: actually reserved, but not written, so it's fast
      truncate -s 10G gentoo_root.img # "sparse file", not properly allocated, fast
      dd if=/dev/zero of=./gentoo_root.img bs=4k iflag=fullblock,count_bytes count=10G # slow, actually writes
      ```
  - [FSArchiver](https://www.fsarchiver.org/quickstart/): save the contents of a file-system to a compressed archive file