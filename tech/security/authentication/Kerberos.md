---
title: Kerberos
type: networking/protocol
category: authentication
tags:
  - auth/Kerberos
  - net/Kerberos
  - net/authentication
desc: |
  Kerberos is a computer-network authentication protocol that works on the basis of tickets to allow nodes communicating over a non-secure network to prove their identity to one another in a secure manner. Its designers aimed it primarily at a client–server model, and it provides mutual authentication—both the user and the server verify each other's identity. Kerberos protocol messages are protected against eavesdropping and replay attacks.
  Kerberos builds on symmetric-key cryptography and requires a trusted third party, and optionally may use public-key cryptography during certain phases of authentication. Kerberos uses UDP port 88 by default.
  ---
  [Wikipedia](https://en.wikipedia.org/wiki/Kerberos_(protocol))
wikipedia: https://en.wikipedia.org/wiki/Kerberos_(protocol)
visibility: public
---
# `=this.title`


## References

[MIT Kerberos defaults @Documentation](https://web.mit.edu/kerberos/krb5-1.13/doc/mitK5defaults.html)
https://wiki.archlinux.org/title/Kerberos
[Jacob's notes on Kerberos](https://git.lwp.rug.nl/lwp/wiki/-/wikis/jacob/Kerberos-Help)
[[LIL_LDAP_Kerberos|LiL course LDAP+Kerberos]]