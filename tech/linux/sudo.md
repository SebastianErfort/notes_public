---
title: sudo
tags:
  - linux
visibility: public
---
- #linux/sudoers `/etc/sudoers{,.d}`
    - must have permissions 0440, not start with `.`, end in `~` and can't have syntax errors, otherwise `sudo` might get broken
    - can be edited/new sudoer added through `visudo [-f /etc/sudoers.d/newsudoer]`  which will set permissions correctly and perform a syntax check
    - or create `llid`: `adduser <username> sudo`
- information
    - `/etc/os-release`
- messages
    - `/etc/issue.net`
    - `/etc/motd.d`
