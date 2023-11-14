---
visibility: public
title: Security
---
# Authentication

[[web-dev#Authentication|My notes on authentication]]

## Kerberos

[[Kerberos|My notes on Kerberos]]

## LDAP

Lightweight Directory Access Protocol
[Wikipedia](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol)
[[rug/lwp/GitLab#LDAP|CIT: GitLab server]]
[[LIL_LDAP_Kerberos|LiL course LDAP+Kerberos]]

# Hardware keys

# hw/security

## YubiKey

# tech/yubikey

## NitroKey

<https://www.nitrokey.com/#comparison>

# Vulnerabilities

Website maintainers can provide a `security.txt` file to give security companies and white hackers standardised information on how to report vulnerabilities.[^1]

[^1]: <https://en.wikipedia.org/wiki/Security.txt>

# Password management

## pass

<https://www.passwordstore.org/>
> The `pass` command with `otp` support is also quite usefull. Esp. when combined with unishare or dropbox.
> Esp. `pass otp -c <account>` is handy.

openSUSE installation

```bash
sudo zypper install password-store pass-otp
```

AddOns

- [`passff`](https://github.com/passff/passff#readme): Firefox plugin

## Passkey

<https://passkeys.io>
> A passkey is a new way to sign in that works completely without passwords. By using the security capabilities of your devices like Touch ID and Face ID, passkeys are way more secure and are easier to use than both passwords and all current 2-factor authentication methods.

## More

<https://github.com/cortex/ripasso>: password manager written in Rust
