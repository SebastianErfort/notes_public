---
title: "Ubuntu Autoinstaller: Subiquity, Cloud-Init and Curtin"
visibility: public
aliases:
  - Ubuntu Unattended Installer
  - Cloud-Init
  - Curtin
  - Subiquity
tags:
  - dev/os/deployment
---
# Ubuntu Autoinstall: Subiquity, Cloud-Init and Curtin

> [!tip] Important (log) files and directories
>
> The working directory of the installer is `/var/snap/subiquity` with subfolders for different stages. The dir for the current stages is symlinked to `current`.
Log files can be found in `/var/log/{installer,cloud-init*,curtin}`, in case of a critical error in `/var/crash`. The journal for example ends up in `/var/log/installer/installer-journal.txt`.  The logs in `/var/log/installer` are copied into the target at the end of the installation.
> The cloud-init autoinstall section used by Curtin can be found in `/autoinstall.yaml`.

## Subiquity: Ubuntu Installer

- Disk encrypytion
    - [Subiquity (Ubuntu server installer): FDE with ZFS and password][subiquity-fde-zfs]
    - [TPM-backed encryption][subiquity-autoinstall-storage]

## Cloud-init

[Documentation](https://cloudinit.readthedocs.io/en/latest/index.html) | [Github](https://github.com/canonical/cloud-init) |  [CLI](https://cloudinit.readthedocs.io/en/latest/topics/cli.html) | [Autoinstall reference](https://ubuntu.com/server/docs/install/autoinstall-reference)

- [Disk Setup](https://cloudinit.readthedocs.io/en/latest/topics/modules.html#disk-setup)
- [Set Hostname](https://cloudinit.readthedocs.io/en/latest/topics/modules.html#set-hostname) and [Update Hostname](https://cloudinit.readthedocs.io/en/latest/topics/modules.html#update-hostname)
- [Customize Cloud-init autoinstall Ubuntu @GoLinuxCloud](https://www.golinuxcloud.com/customize-cloud-init-user-data-ubuntu/)

> [!info]- [Boot stages](https://cloudinit.readthedocs.io/en/latest/topics/boot.html)
>
> - Generator
> - Local
> - Network
> - Config
> - Final

Cloud-init assumes defaults where no explicit config is given. It requires yaml-format files

- meta-data
- user-data (optional): [documentation](https://cloudinit.readthedocs.io/en/latest/topics/format.html) | [examples](https://cloudinit.readthedocs.io/en/latest/topics/examples.html) | [further examples](https://gist.github.com/dbkinghorn/c236aea31d76028b2b6ccdf6d3c6f07e)
- vendor-data (optional)

To disable cloud-init (after installation)

```bash
sudo touch /etc/cloud/cloud-init.disabled
```

and/or set `cloud-init=disabled` on the kernel command line^[<https://stackoverflow.com/a/50910735>]^[<https://gist.github.com/zoilomora/f862f76335f5f53644a1b8e55fe98320>]
Might haver to run on first boot it needs to run to finish things up.


### user-data file

[Cloud-init documentation examples](https://cloudinit.readthedocs.io/en/latest/topics/examples.html) |  [local example file](file:///home/erfort/journal/journal/20220429_user-data_preserve)
[Including files/splitting](https://cloudinit.readthedocs.io/en/latest/topics/format.html#include-file) | [Merging files](https://cloudinit.readthedocs.io/en/latest/topics/merging.html)

Validate `user-data` file:

```bash
cloud-init devel schema --config-file user-data-file
```

> [!info] Stages/sections (see [source code: cmdlist.py](https://github.com/canonical/subiquity/blob/main/subiquity/server/controllers/cmdlist.py))
>
> ```yaml
> early-commands:
> late-commands:
> error-commands:
> ```

> [!example]- Example storage config section
>
> ```yaml
> autoinstall:
>   storage:
>     # version: 2
>     # swap:
>     #   size: 8G
>     config:
>       - type: disk
>         id: the_disk
>         ptable: gpt
>         grub_device: true
>         preserve: true
>       # bios_grub will allow an EFI system to use BIOS boot as well. Should only be needed in bios boot mode, not for efi
>       # - { type: partition, id: bios_grub, device: the_disk,   size: 1M,   flag: bios_grub,   preserve: false, grub_device: true } # bios_grub
>       - { type: partition, device: the_disk, id: efi,     number: 2, size: 512M,   preserve: true, flag: boot, grub_device: true }  # EFI
>       - { type: partition, device: the_disk, id: root,    number: 3, size: 100G,   preserve: true, wipe: superblock } # root
>       - { type: partition, device: the_disk, id: var_tmp, number: 5, size: 20G,    preserve: true, wipe: superblock } # /var/tmp
>       - { type: partition, device: the_disk, id: swap,    number: 4, size: 8G,     preserve: true, flag: swap } # swap
>       - { type: partition, device: the_disk, id: keep1,   number: 1, size: 50G,    preserve: true } # "windows"
>       - { type: partition, device: the_disk, id: keep2,   number: 6, size: 23082303488, preserve: true } # "D"
>       # Since this is the last partition, curtin is very specific about the size!
>       #
>       - { type: format, volume: efi,     id: efi_fs,     fstype: fat32, label: EFI,      }
>       - { type: format, volume: root,    id: root_fs,    fstype: ext4,  label: lwproot   }
>       - { type: format, volume: var_tmp, id: var_tmp_fs, fstype: ext4,  label: lwpvartmp }
>       - { type: format, volume: swap,    id: swap_fs,    fstype: swap,  label: lwpswap   }
>       - { type: format, volume: keep1,   id: keep1_fs,   fstype: ntfs,  preserve: true }
>       - { type: format, volume: keep2,   id: keep2_fs,   fstype: fat32, preserve: true, label: LWPD }
>       #
>       - { type: mount, device: efi_fs,     id: mnt0, path: /boot/efi }
>       - { type: mount, device: root_fs,    id: mnt1, path: / }
>       - { type: mount, device: var_tmp_fs, id: mnt2, path: /var/tmp }
>       - { type: mount, device: swap_fs,    id: mnt3, path: '' }
>       - { type: mount, device: keep2_fs,   id: mnt4, path: /D }
> ```

> [!info]- [autoinstall-generator](https://discourse.ubuntu.com/t/autoinstall-generator-tool-to-help-with-creation-of-autoinstall-files-based-on-preseed/21334)
>
> Converting the preseed to `cloud-init` format can partially be done with `autoinstall-generator`
>
> - source: <https://github.com/covertsh/ubuntu-autoinstall-generator>
> - install snap <https://snapcraft.io/autoinstall-generator>
> - run
>
> ```
> autoinstall-generator --cloud --debug preseed.txt user-data
> ```
>
> but most of our preseed isn't supported as can be seen in the debug output.


### Modules

[Module Reference](https://cloudinit.readthedocs.io/en/latest/topics/modules.html)

#### snap

Snaps get installed during first boot^[<https://bugs.launchpad.net/subiquity/+bug/1778226>] which means cloud-init can't be disabled for the first boot.

### Specify config source (seedfrom)

See <https://cloudinit.readthedocs.io/en/latest/topics/datasources/nocloud.html>

The source for the config (`user-data` etc.) can be set as a kernel parameter (in the appropriate boot menu entry):

```
menuentry "Autoinstall" {
  set gfxpayload=keep
  linux \/casper\/vmlinuz   quiet autoinstall ds=nocloud\;s=/cdrom/<image>/ ---
  initrd  \/casper\/initrd
}
```

and can also be a remote source (requires `ds=nocloud-net`).

### Datasources

> [!info]- [From the documentation](https://cloudinit.readthedocs.io/en/latest/topics/datasources.html)
>
> Datasources are sources of configuration data for cloud-init that typically come from the user (i.e. userdata) or come from the cloud that created the configuration drive (i.e. metadata). Typical userdata would include files, YAML, and shell scripts while typical metadata would include server name, instance id, display name and other cloud specific details.
>
> Since there are multiple ways to provide this data (each cloud solution seems to prefer its own way) internally a datasource abstract class was created to allow for a single way to access the different cloud systems methods to provide this data through the typical usage of subclasses.
>
> Any metadata processed by cloud-init’s datasources is persisted as /run/cloud-init/instance-data.json. Cloud-init provides tooling to quickly introspect some of that data. See Instance Metadata for more information.

> [!tip] TL; DR
> `/run/cloud-init/instance-data.json` contains data from the various data-sources. This data can be used for example in `user-data` with Jinja templating, see [example](https://cloudinit.readthedocs.io/en/latest/topics/instancedata.html#using-instance-data).
>
> So maybe we can add hardware information in a similar way to `instance-data.json` from a bash script or whatever and use that in `user-data` via Jinja templating to set for example the disk layout.

#### NoCloud

Since we're not using an actual cloud provider, we require the [NoCloud datasource](<https://cloudinit.readthedocs.io/en/latest/topics/datasources/nocloud.html>)

See [Cloud-Init documentation on NoCloud Datasource](https://cloudinit.readthedocs.io/en/latest/reference/datasources/nocloud.html).

- [Network](https://cloudinit.readthedocs.io/en/latest/reference/datasources/nocloud.html#example-config)

### Config

- [Network](https://cloudinit.readthedocs.io/en/latest/reference/network-config.html)

## Curtin

[🐛 Bugs](https://bugs.launchpad.net/curtin/+bugs)

[Documentation](https://curtin.readthedocs.io/en/latest/index.html) |  [YAML examples](https://github.com/canonical/curtin/tree/master/examples) (8yrs old)

> Curtin is intended to be a bare bones “installer”. Its goal is to take data from a source, and get it onto disk as quick as possible and then boot it. The key difference from traditional package based installers is that curtin assumes the thing its installing is intelligent and will do the right thing.

### Stages

😠 Trying to find a list of the accepted stages for the `autoinstall` section in `user-data` is proving difficult.

Can be (de-)activated in the `stages` section of the `autoinstall` part of `user-data`

- Install Environment boot
- Early Commands: `early-commands`
- Partitioning
- Network Discovery and Setup
- Extraction of sources
- Hook for installed OS to customize itself
- Final Commands: `late-commands`

Easiest way to get a terminal in non-interactive stages (`early`, `late`): produce an error, for example run `false`.

### Commands

- `curtin block-discover`: print current storage information in the usual JSON format that translated to the YAML format used in the `storage` section in `user-data > autoinstall`. Doesn't report disk size and free space has to be calculated from "gaps" around partitions.
    [Work LWP: Remco's examples](https://git.lwp.rug.nl/lwp/unattended/lwp5/-/commit/d2b61dba51093790528bbdcf976614d42386fffc)
- `curtin in-target`: run command in installation system

    ```bash
    curtin in-target -t/target -- mycmd
    ```

    Alternatively use regular `chroot` (see also `lwp-setup/util/chroot*.sh`)

    ```bash
    mount /dev/disk/by-label/lwproot /target
    mount -t proc none /target/proc
    mount -t sysfs none /target/sys
    mount -o bind /dev /target/dev
    mount -o bind /tmp /target/tmp

    cp /etc/resolv.conf /target/etc

    chroot /target

    /opt/puppetlabs/puppet/bin/puppet agent -t
    ```

- `curtin wipe --quick --all-unused-disks`

### Storage module

The section `storage: config` of the `autoinstall` section of the `user-data` file allows to specify which disk(s) to use for an installation and what to do with (existing) partitions. Generally the structure is

```yaml
autoinstall:
  ...
  storage:
    config:
      - type: disk
        ...
      - type: partition
        ...
      - type: format
        ...
      - type: mount
        ...
```

- `disk`
- `partition`
- `format`: filesystem, supports ext4, ext3, fat32, fat16, swap, xfs, zfsroot (and anything that has a corresponding `mkfs.<fstype>` command, but `mkfs.exfat` is not present in the current installer environment)

__Installation on a disk with existing partitions that should be reused or be left untouched, keyword `preserve`:__

- `disk`: curtin tries to re-use the disk layout, matching existing partitions with specified data
- `partition`: partition won't be resized
- `format`:  content (files, folders, etc.) will be preserved


## Changelog

- [stop using apt-key](https://github.com/canonical/curtin/commit/1797204fd5df4e0a647d73734e2f47691828c0a1)


## References

[subiquity-fde-zfs]: <https://discourse.ubuntu.com/t/subiquity-24-04-1-has-been-released-to-the-stable-channel/44493> (accessed 2024-09-10)
[subiquity-autoinstall-storage]: <https://canonical-subiquity.readthedocs-hosted.com/en/latest/reference/autoinstall-reference.html#storage>
