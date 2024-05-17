---
title: General Parallel File System (GPFS)
aliases:
  - IBM Storage Scale
  - IBM Spectrum Scale
  - GPFS
developer: IBM
visibility: public
---
# GPFS

## Features

From [Wikipedia].

It is a [clustered file system](https://en.wikipedia.org/wiki/Clustered_file_system "Clustered file system"). It breaks a file into blocks of a configured size, less than 1 megabyte each, which are distributed across multiple cluster nodes.
  
Features of the architecture include

- Distributed metadata, including the directory tree. There is no single "directory controller" or "index server" in charge of the filesystem.
- Efficient indexing of directory entries for very large directories.
- Distributed locking. This allows for full [POSIX](https://en.wikipedia.org/wiki/POSIX "POSIX") filesystem semantics, including locking for exclusive file access.
- Partition Aware. A failure of the network may partition the filesystem into two or more groups of nodes that can only see the nodes in their group. This can be detected through a heartbeat protocol, and when a partition occurs, the filesystem remains live for the largest partition formed. This offers a graceful degradation of the filesystem — some machines will remain working.
- Filesystem maintenance can be performed online. Most of the filesystem maintenance chores (adding new disks, rebalancing data across disks) can be performed while the filesystem is live. This maximizes the filesystem availability, and thus the availability of the supercomputer cluster itself.

Other features include high availability, ability to be used in a heterogeneous cluster, disaster recovery, security, [DMAPI](https://en.wikipedia.org/wiki/DMAPI "DMAPI"), [HSM](https://en.wikipedia.org/wiki/Hierarchical_Storage_Management "Hierarchical Storage Management") and [ILM](https://en.wikipedia.org/wiki/Information_Lifecycle_Management "Information Lifecycle Management").

## References

- [Wikipedia]

[wikipedia]: <https://en.wikipedia.org/wiki/GPFS>