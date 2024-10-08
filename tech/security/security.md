---
visibility: public
title: Security
---
## Firewall

- [[iptables]]
- [[Shorewall]]
- [[Firewall-Daemon]]

### Tools

- [fail2ban](https://github.com/fail2ban/fail2ban): Daemon to ban hosts that cause multiple authentication errors
    - [extend event logging](https://www.jwz.org/blog/2024/07/fail2ban/)

## Authentication

[[web-dev#Authentication|My notes on authentication]]

### Kerberos

[[authentication/Kerberos|My notes on Kerberos]]

### LDAP

Lightweight Directory Access Protocol
[Wikipedia](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol)
[[rug/lwp/GitLab#LDAP|CIT: GitLab server]]
[[LIL_LDAP_Kerberos|LiL course LDAP+Kerberos]]

## Hardware keys

Tags: #hw/security

### YubiKey

Tags: #tech/yubikey

### NitroKey

<https://www.nitrokey.com/#comparison>


## Software

```dataview
TABLE WITHOUT ID
("[" + title + "](" + file.path + ")") AS "Name",
("[Website](" + url + ")") AS "Links",
(join(file.tags,", ")) AS "Tags"
WHERE type = "software" and contains(category,"security") AND contains(file.folder,"public/tech")
```


### Static Application Security Testing (SAST)

### Dynamic Application Security Testing (DAST)

- [(OWASP) ZAP](https://www.zaproxy.org/)
- [Burp Suite](https://portswigger.net/burp)

## Vulnerabilities

Website maintainers can provide a [`security.txt`][security.txt] file to give security companies and white hackers standardised information on how to report vulnerabilities.

## Password management

- [ripasso](https://github.com/cortex/ripasso): password manager written in Rust

### pass

<https://www.passwordstore.org/>
> The `pass` command with `otp` support is also quite usefull. Esp. when combined with unishare or dropbox.
> Esp. `pass otp -c <account>` is handy.

openSUSE installation

```bash
sudo zypper install password-store pass-otp
```

AddOns

- [`passff`](https://github.com/passff/passff#readme): Firefox plugin

### Passkey

<https://passkeys.io>
> A passkey is a new way to sign in that works completely without passwords. By using the security capabilities of your devices like Touch ID and Face ID, passkeys are way more secure and are easier to use than both passwords and all current 2-factor authentication methods.


## References

- [article @theregister: Secure Web Gateway bypasses (promoting end-point protection)](https://www.theregister.com/2024/08/09/secure_web_gateways_are_anything/)

[security.txt]: <https://en.wikipedia.org/wiki/Security.txt>
