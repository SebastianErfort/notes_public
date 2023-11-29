---
title: AppArmor vs. SELinux
author: Sebastian Erfort
date: 2022-01-03
theme: metropolis
output: AppArmor_vs_SELinux
tags:
  - Linux/security
  - Linux/AppArmor
  - Linux/SELinux
---

## Motivation

Beside existing Discretionary Access Control (DAC, permissions, capability)  harden the security through mandatory access control (MAC), limiting file/directory permissions network access, raw socket access


## Overview

- Since Linux kernel 2.6 Linux Security Modules ([LSMs](https://www.kernel.org/doc/html/v4.15/admin-guide/LSM/index.html)): interface between Linux kernel and security modules
- not actually loadable, instead selectable at kernel build-time via `CONFIG_DEFAULT_SECURITY` or at boot-time via `security=...` kernel command line argument
- List of LSMs in `/sys/kernel/security/lsm` in decreasing priority, for example `lockdown,capability,apparmor` - LSM only invoked if DAC allows access

- Currently approved: AppArmor, SELinux, Smack and Tomoyo
    - AppArmor: Ubuntu, Debian, openSUSE, ...
    - SELinux (Security Enhanced Linux): NSA, inode-based, RedHat and Fedora
    - [SMACK](https://www.kernel.org/doc/html/v4.15/admin-guide/LSM/Smack.html ) (Simplified Mandatory Access Control Kernel): label-based
    - TOMOYO: name-based MAC extension, meant to complement inode-based security (like SELinux), but so far LSMs don't combine, Tyzen (app development distro)


### Comparison AppArmor vs. SELinux

From [RedHat article](https://www.redhat.com/sysadmin/apparmor-selinux-isolation)

Name       | Type Enf.        | MLS/MCS | Policy gen.      | Container gen.
:---------:|:----------------:|:-------:|:----------------:|:-----------------------:
AppArmor   | Yes              |   No[^1]   |       Yes        |  No
SELinux    | Yes              |   Yes   |       No[^2]        |  Yes

[^1]: [AppArmor Wiki](https://gitlab.com/apparmor/apparmor/-/wikis/AppArmorMLS)  speaks of sth. like MLS/MCS style security using different uids, but the information is 4 years old and even then said you shouldn't trust it
[^2]: There is something not too sophisticated, but I don't remember where I read that.

- AppArmor Works with file paths instead of file labels unlike SELinux ➡ can't handle removable storage, but filesystem-agnostic? Still true?
- But SELinux requires a filesystem that supports "security labels" and thus doesn't work with NFS files


## AppArmor

![[AppArmor]]


## SELinux

![[SELinux|SELinux]]
## Summary
>
> To summarize, SELinux is a more complex technology that controls more operations on a system and separates containers by default. This level of control is not possible with AppArmor because it lacks MCS. In addition, not having MLS means that AppArmor cannot be used in highly secure environments.
