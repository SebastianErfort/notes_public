---
title: SELinux
---
# SELinux

- default is to deny - any access has to be specified explicitely
- inode-based security labels, including processes and system resources (*SELinux context* or *label*) - no ambiguity as with multiple paths for same file/directory
- more fine-grained control, but policies are more complex
- more control over network access, [can be paired with IP tables](https://www.linux.com/training-tutorials/using-selinux-and-iptables-together/)
    - packets can be labelled
- largely developed by the NSA, military grade security possible
- shipped with RedHat and Fedora
- has Multi-Level Security (MLS) and Multi-Category Security (MCS) in contrast to AppArmor which is important for containers (probably not a constant use case for AWP)


## How SELinux works

- there is the reference policy
- three modes: disabled, permissive (only logging access denia) and enforcing - can be set per domain (e.g. `httpd_t`) <!-- # semanage permissive -a httpd_t -->
- label fields: *user*, *role*, *type* and *security level*
- *type* `_t` used in most common policy rules, not full label, e.g. `httpd_t` for web server and `httpd_sys_content_t` for files/dirs in `/var/www/html/`, but no access to `/tmp`
- enabling SELinux on Ubuntu should be fairly simple

  ```bash
  $ sudo apt install policycoreutils selinux-utils \
  selinux-basics
  $ sudo selinux-activate
  $ sudo selinux-config-enforcing
  # Reboot, labelling triggerd, automatic reboot
  ```


## Examples

- reference policy
- pre-defined SELinux users: normal users can be mapped, e.g. to restrict access to set user ID applications (`sudo`, `su`)
- processes run in separated domains, only specified access to other processes and paths are allowed
- helps mitigate configuration mistakes, e.g. unlimited zone transfer attacks where DNS servers replicate information by preventing alteration of zone files by zone transfers


## Pros & Cons SELinux

Pro

- all processes and files are labeled, access only if there is a policy rule
- fine-grained control, including network ([can be paired with IP tables](https://www.linux.com/training-tutorials/using-selinux-and-iptables-together/)) and sockets
- supports MLS/MCS setups

<!-- - decisions are cached, increasing performance -->

Con

- policies are more complex and more difficult to create
- not default, would have to be adapted from other distros