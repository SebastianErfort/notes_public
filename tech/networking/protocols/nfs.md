---
title: Network File System (NFS)
acronym: NFS
desc-short: Distributed file system protocol, allowing a user on a client computer to access files over a computer network
wikipedia: "https://en.wikipedia.org/wiki/Network_File_System"
tags:
  - "#tech/networking/nfs"
  - "#tech/networking/protocol"
full-name: Network File System
type: protocol
category:
  - networking/files
---
# Network File System

<https://wiki.archlinux.org/title/NFS>

## ACLs (Access Control Lists)

Different models with interoperability problem: NFSv4, Windows and POSIX ACLsw
<https://wiki.linux-nfs.org/wiki/index.php/ACLs>
<https://wiki.archlinux.org/title/Access_Control_Lists>

- edit
    - `setfacl -m "u:user:permissions" file/dir`
    - `nfs4_editfacl file/dir`
- read

  ```bash
  getfacl <file/dir>
  # find files with ACLs beyond POSIX (-s) recursively (-R)
  getfacl -Rsp <dir> | grep '# file:' | cut -d" " -f3
  ```

- if `ls` shows a `+` for files/dirs, they have ACLs

## Parallel NFS (pNFS)

Tags: #tech/pNFS

- [pnfs.com](http://www.pnfs.com/)
- [RedHat: pNFS](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/nfs-pnfs)
- [linux-nfs.org: Configuring pNFS](https://wiki.linux-nfs.org/wiki/index.php/Configuring_pNFS/spnfsd)

## Authentication

### Kerberos

See [[Kerberos#NFS|Kerberos: NFS]]


## References

- <https://wiki.archlinux.org/title/NFS>
- <https://learn.microsoft.com/en-us/windows-server/storage/nfs/nfs-overview>
- <https://en.wikipedia.org/wiki/Network_File_System>
- [Optimizing NFS Performance (tldp.org)](https://tldp.org/HOWTO/NFS-HOWTO/performance.html)

