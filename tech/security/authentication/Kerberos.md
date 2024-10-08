---
title: Kerberos
type: networking/protocol
category: authentication
tags:
  - tech/auth/Kerberos
  - tech/networking/Kerberos
  - tech/networking/authentication
desc: "Kerberos is a computer-network authentication protocol that works on the basis of tickets to allow nodes communicating over a non-secure network to prove their identity to one another in a secure manner. Its designers aimed it primarily at a client–server model, and it provides mutual authentication—both the user and the server verify each other's identity. Kerberos protocol messages are protected against eavesdropping and replay attacks.\nKerberos builds on symmetric-key cryptography and requires a trusted third party, and optionally may use public-key cryptography during certain phases of authentication. Kerberos uses UDP port 88 by default.\n---\n[Wikipedia](https://en.wikipedia.org/wiki/Kerberos_(protocol))\n"
wikipedia: "https://en.wikipedia.org/wiki/Kerberos_(protocol)"
visibility: public
---
NFS authentication: [Microsoft guide](https://learn.microsoft.com/en-us/windows-server/storage/nfs/deploy-nfs#configure-nfs-authentication)

- **Krb5**: Uses the Kerberos version 5 protocol to authenticate users before granting them access to the file share.
- **Krb5i**: Uses the Kerberos version 5 protocol to authenticate with integrity checking (checksums), which verifies that the data hasn't been altered.
- **Krb5p**: Uses the Kerberos version 5 protocol, which authenticates NFS traffic with encryption for privacy. This option is the most secure Kerberos option.


## Config

Different *flavours*[^1]

- **Krb5**: Uses the Kerberos version 5 protocol to authenticate users before granting them access to the file share.
- **Krb5i**: Uses the Kerberos version 5 protocol to authenticate with integrity checking (checksums), which verifies that the data hasn't been altered.
- **Krb5p**: Uses the Kerberos version 5 protocol, which authenticates NFS traffic with encryption for privacy. This option is the most secure Kerberos option.

[^1]: <https://learn.microsoft.com/en-us/windows-server/storage/nfs/deploy-nfs>


## Network Filesystems

### Common Internet File System (CIFS)

*Auto-mount*: [cifs.com](https://cifs.com/)

[man page mount.cifs](https://linux.die.net/man/8/mount.cifs): use option `cruid` to specify which user's credentials to use for NFS (CIFS) authentication, e.g. `sec=krb5,cruid=${UID}`


## Tools

- [msktutil]
    > Msktutil creates user or computer accounts in Active Directory, creates Kerberos keytabs on Unix/Linux systems, adds and removes principals to and from keytabs and changes the user or computer account's password.


### Resources

## References

- [MIT Kerberos defaults @Documentation](https://web.mit.edu/kerberos/krb5-1.13/doc/mitK5defaults.html)
- <https://wiki.archlinux.org/title/Kerberos>
- [Jacob's notes on Kerberos](https://git.lwp.rug.nl/lwp/wiki/-/wikis/jacob/Kerberos-Help)
- [[LIL_LDAP_Kerberos|LiL course LDAP+Kerberos]]
- <https://learn.microsoft.com/en-us/windows-server/storage/nfs/deploy-nfs>

[msktutil]: <https://github.com/msktutil/msktutil>
