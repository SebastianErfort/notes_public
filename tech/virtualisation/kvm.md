---
title: KVM
title-long: Kernel-based Virtual Machine
type: software
category:
  - virtualisation
visibility: public
url: http://www.linux-kvm.org/
source: https://git.kernel.org/pub/scm/virt/kvm/kvm.git
docs: https://linux-kvm.org/page/Documents
developer: The Linux Kernel community
desc-short: KVM (for Kernel-based Virtual Machine) is a full virtualization solution for Linux on x86 hardware containing virtualization extensions (Intel VT or AMD-V).
same:
  - "[[QEMU]]"
up:
  - "[[libvirt]]"
---
# KVM

Check CPU virtualisation support

```bash
ls /dev/kvm
# or
lsmod | grep kvm
```

## Config and Management

Cumbersome directly, but tools exist to help

- [[libvirt#virsh|virsh]]: command line tool
- [[libvirt#virt-manager|Virtual Machine Manager]]: GUI tool
- GUI: GNOME Boxes, ...

## Quick-start

Following [RedHat guide][redhat-kvm-libvirt]

1. confirm CPU virtualisation: `sudo grep -E 'svm|vmx' /proc/cpuinfo`
1. obtain image, e.g. from [OpenStack image guide](https://docs.openstack.org/image-guide/obtain-images.html)
1. customisee VM
   
    ```sh
    virt-customize \
    -a /var/lib/libvirt/images/imagetest1.qcow2 \
    --hostname vmlab01 \
    --root-password password:rootpw \
    --ssh-inject 'root:file:labkey.pub' \
    --uninstall cloud-init \
    --selinux-relabel
    ```

1. install VM (requires active network[^network-error])
   
    ```sh
    virt-install \
    --name vmlab01 \
    --memory 1024 \
    --vcpus 1 \
    --disk /var/lib/libvirt/images/image.qcow2 \
    --import \
    --os-type linux --os-variant generic \
    --noautoconsole
    ```

1. access VM
   
    ```sh
    virsh domifaddr vmlab01
    ssh -i labkey root@192.168.122.76
    ```


## Migration

Migrate KVM host with ZFS filesystem

1. create snapshot
2. send and receive
   
    ```bash
    sudo zfs send <image> | ssh -Y <target> sudo zfs receive <target image>
    ```

1. copy libvirt XML definition
   
    ```bash
    virsh dumpxml > tempate.xml
    virsh -c qemu+ssh://<target> create --paused template.xml
    ```


## References

- [OpenSUSE: Setting up a KVM VM Host Server](https://doc.opensuse.org/documentation/leap/virtualization/html/book-virtualization/cha-qemu-host.html)
- [RedHat guide: Lab with KVM and libvirt][redhat-kvm-libvirt]

[redhat-kvm-libvirt]: <https://www.redhat.com/sysadmin/build-lab-quickly>
[^network-error]: error `network ... not active`

```bash
# virsh net-list --all
virsh net-start default
# start at boot
virsh net-autostart default
```
