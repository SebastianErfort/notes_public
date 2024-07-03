---
title: Systemd
type: software
category: Linux
# url:
# docs:
# github:
# developer:
# desc-short: |
#   ...
# tags:

visibility: public
---
# Systemd

`= ("[Website](" + this.website + ")")` | `= ("[Github](" + this.github + ")")` | `= ("[Documentation](" + this.docs + ")")`

## Commands

- [List units and unit files](https://www.golinuxcloud.com/systemctl-list-services/#systemctl_list_unit_files_loaded_in_memory)

  ``` bash
  systemctl list-units [--all]
  systemctl list-unit-files [--type=service (mount,...)] [--state=enabled]
  systemctl status
  systemctl is-active
  ```

- analyse boot as plot to analyse startup process and to examine dependencies

  ```
  systemd-analyze plot
  ```

  > [!info]- Example plot
  > ![[systemd.svg]]


## Virtualisation and Containerisation

The package `systemd-container` includes tools for management of virtual machines and containers.

> `machinectl` may be used to introspect and control the state of the systemd virtual machine and container registration manager systemd-machined.service

This can be used to impersonate user (e.g. Docker process owner) and will properly give access to sockets etc. required to interact with hypervisors.

```sh
machinectl shell --uid=<user id>
# or (empty host after @ defaults to localhost)
machienctl shell <user>@
```


## Service Files

See `man systemd.directives` for available stanzas.

- [Condition and Asserts](https://www.freedesktop.org/software/systemd/man/systemd.unit.html#Conditions%20and%20Asserts): "Before the unit is started, systemd will verify that the specified conditions and asserts are true"

## Documentation

- [Unit configuration](https://www.freedesktop.org/software/systemd/man/systemd.unit.html#)
- [Service unit configuration](https://www.freedesktop.org/software/systemd/man/systemd.service.html#)
- [Exection environment configuration](https://www.freedesktop.org/software/systemd/man/systemd.exec.html)


## Security

[Hardening systemd - Ubuntu version](https://github.com/konstruktoid/hardening)


## References

- [Create a Systemd service @linuxhandbook.com](https://linuxhandbook.com/create-systemd-services/)
- [service guidelines (for packaging) @suse.com](https://en.opensuse.org/openSUSE:Systemd_packaging_guidelines)
- [create a service to run at boot @suse.com](https://www.suse.com/support/kb/doc/?id=000019672)
- [Controversies and alternatives @howtogeek](https://www.howtogeek.com/675569/why-linuxs-systemd-is-still-divisive-after-all-these-years/)
- [homed: home directory management @howtogeek](https://www.howtogeek.com/673018/systemd-will-change-how-your-linux-home-directory-works/)

*Run service as user*: []

1. ensure resources such as scripts are readable by user
2. add `User=...` and `Group=...` to `[Service]` section
