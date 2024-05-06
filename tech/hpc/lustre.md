---
title: Lustre
url: "https://www.lustre.org/"
docs: "https://www.lustre.org/documentation/"
---
three main components:

- Metadata Server (MDS): provide metadata services for a file system and manages a Metadata Target (MDT) that stores the file metadata
- Object Storage Server (OSS): manage the Object Storage Targets (OST) that store the file data objects
- Lustre clients

utilities

- `mkfs.lustre`: format a disk for a Lustre service
- `tunefs.lustre`: modify configuration information on a Lustre target disk
- `lctl`: directly control Lustre via an ioctl interface
- `mount.lustre`: start a Lustre client or target service


## References

- `= ("[Documentation](" + this.docs + ")")`
- [Lustre101](http://lustre.ornl.gov/lustre101-courses/) by the Oak Ridge Leadership Computing Facility at Oak Ridge National Laboratory