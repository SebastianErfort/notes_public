---
title: Security on Linux
visibility: public
tags:
  - linux/security/luks
  - linux/auth/pam
---
# Security on Linux

## Encryption

- VeraCrypt: [Website](https://www.veracrypt.fr/en/Home.html) | [Wikipedia](https://en.wikipedia.org/wiki/VeraCrypt) | [RedHat](https://access.redhat.com/solutions/100463) | [RedHat Article](https://www.redhat.com/sysadmin/disk-encryption-luks)


### Linux Unified Key Setup (LUKS)

[Wikipedia](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup)

Opening and mounting an encrypted device

```
sudo cryptsetup luksOpen /dev/sdxx cr_dev
udisksctl mount -b /dev/mapper/cr_dev
```

Unmounting and closing

```
udisksctl unmount -b /dev/mapper/cr_dev
sudo cryptsetup luksClose cr_dev
```

References

- <https://www.redhat.com/en/blog/implementing-corporate-laptop-encryption-using-luks>

## Sandboxing

- [Firejail]

## Authentication

### PAM (Pluggable Authentication Module)

PAM (Pluggable Authentication Modules): centralised authentication mechanism
Tags: #linux/PAM

- [Arch Wiki: PAM](https://wiki.archlinux.org/title/PAM)
- [RedHat article: PAM](https://www.redhat.com/sysadmin/pluggable-authentication-modules-pam)
- [Enhance Linux user security with PAM](https://www.redhat.com/sysadmin/linux-security-pam): enforce password requirements
- [# Anatomy of a Linux Pluggable Authentication Modules (PAM) configuration file @RedHat](https://www.redhat.com/sysadmin/pam-configuration-file)
- [Setting up multi-factor authentication on Linux systems (using google-authenticator) @RedHat](https://www.redhat.com/sysadmin/mfa-linux)

#### General & config

- can break security/system if configured incorrectly (allow any password or none at all)
- a library for programs like SSH to authenticate users
- configuration files in `/etc/pam.d`
- in our puppet modules the configuration is not written directly, but through the Debian program `pam-auth-update` which is part of the `libpam-runtime` package

This is a handy tool for testing (on linux)

```bash
git clone https://github.com/pbrezina/pam-test
```

You can use it by defining `/etc/pam.d/pam_test`

```
auth  [success=3 default=ignore]  pam_unix.so nullok try_first_pass
auth  required                  pam_sss.so use_first_pass
auth    [success=1]                     /home/user/test/lib/security/pam_2fa.so config=/home/user/.config/netiq.json
## here's the fallback if no module succeeds
auth  requisite      pam_deny.so
auth  required      pam_permit.so
auth  required                        pam_group.so use_first_pass
```

and then running

```bash
./pam_test auth foobar
```

from the `pam_test` directory.

#### Modules

```
# pam_exec
auth [succeed=1, default=ignore]  pam_exec.so quiet exposeauthk /path/to/file
# pam_succeed_if
# pam_regex
# https://www.gnu.org.ua/software/pam-modules/manual/html_chapter/regex.html
# Seems not be available in default Ubuntu PAM installation and has to be compiled manually. :facepalm:
# - can be used to transform for example username, say to all lower case
auth [...] pam_regex.so extended regex=... transform=s/.*/\L&/g
# pam_ssh_agent_auth
# Package: `libpam-ssh-agent-auth`
```

- see [[projects/PAM_SSH-agent|Work LWP: project sudo with SSH agent PAM]]


## References

- [LDAP](https://ldap.com/) | [slapd: Stand-alone LDAP Daemon](https://linux.die.net/man/8/slapd) | [LDAP Wiki](http://ldapwiki.com/wiki/Main)
- [Enhancing Linux security with Advanced Intrusion Detection Environment (AIDE) @RedHat](https://www.redhat.com/sysadmin/linux-security-aide)

[Firejail]: <https://firejail.wordpress.com/>
