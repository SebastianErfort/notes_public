---
title: SSH
tags:
  - tech/SSH
visibility: public
---
# SSH

## Config

### General

```config
Host xyz x* Enterprise
  HostName 123.456.78.90
  User Picard
  IdentityFile ~/.ssh/super-secret-key

# for patterns beyond simple wildcards
Match exec "echo %h | grep -E '<regex>'"
  ...
```

- `Host` can be any identifier, even regular expressions
- `HostName` is the public hostname or IP address of your remote machine
- `User` is the username for this connection
- `IdentityFile` is the SSH private key for this connection
- `Match` can be used to execute shell commands for extended pattern matching[^config_match]

### Forwarding

forward private keys, so they can be used on the remote host

```ssh_config
Host xyz
  ForwardAgent yes
```

### Proxy Command

SSH-tunneling through intermediate host (jumphost). Outdated and vulnerable,[^cve-proxy-command] use `ProxyJump` instead[^6]

```
Host xyz
  ProxyCommand ssh proxy.host nc -w1 %h %p
```

### ProxyJump

Preferred way of connecting to host through intermedia host(s), which are called jump hosts or bastions (as they often are security-hardened entry points to networks)[^6]

```bash
ssh -J jumphost1[,jumphost2,...] remotehost
```

or configure

```
Host jumphost
    HostName <IP address or hostname>

# remote host only accessible through jumphost
Host remotehost
    HostName <IP address or hostname>
    ProxyJump jumphost
```


### ControlMaster

use an open connection for subsequent connections, so you don't have to enter credentials again and it's faster

```ssh_config
host *
    # Only one connection per host
    # Check connection status: > ssh -S ~/.ssh/$socket -O check <bogus arg>
    ControlMaster auto
    ControlPersist 1
    ControlPath ~/.ssh/controlmaster/%r@%h:%p
```

Check status

```bash
ssh -S /path/to/socket -O check <bogus arg>
```


## Commands

```sh
# Run local script on remote host[^1]
ssh user@host "bash -s" -- < local_script.sh arg1 arg2 ...
# skip host verification prompt (security!)
ssh -o StrictHostKeyChecking=no ...
# edit remote files
# supported protocols depend on program: sftp, rsync, https, ...
<program> scp://user@server[:port]//path/to/file
```


### SSH-Add

Add identities to the SSH agent. This allows to use keys without requiring the password every time they're used. Consider limiting the time they'll be held in the agent.

```sh
ssh-add -t 2h ~/.ssh/<key>
```


### SSH-Keygen

[cheat cheatsheet](file://.config/cheat/cheatsheets/community/ssh-keygen)

Algorithm recommendation[^2][^3]

```sh
ssh-keygen -t ed25519 -a 100
```

[^2]: <https://security.stackexchange.com/a/144044>
[^3]: <https://blog.stribik.technology/2015/01/04/secure-secure-shell.html>

## SOCKS proxy

Tags: #tech/SSH/SOCKS
default port:[^4] 1080

[^4]: [IANA: ports](_networking.md#^d2523a)


SSH config

```
Host hostname
    User username
    HostName %h.domain.com
    # SOCKS proxy
    # RemoteForward 1080
    DynamicForward 1080 # corresponds to CL option -D
```

then configure applications to use that proxy.[^5]

For example in Firefox, usage of a SOCKS proxy can be selective for certain URLs, e.g. using the [[Firefox#FoxyProxy|extension FoxyProxy]].


## Tools

- [assh](https://github.com/moul/assh) (I haven't tested it, didn't have the need yet)
  > A transparent wrapper that adds support for regex, aliases, gateways, dynamic hostnames, graphviz, json output, yaml configuration, and more to SSH.
- sshpass: provide password non-interactively. Security issue but haven't found another way to enter a key pass phrase non-interactively (exposed e.g. in `ps`). Slightly better providing the password through a file ^sshpass

    ```sh
    sshpass -P"passphrase for key" -p <password> ssh ...
    # -P command prompt triggering password insertion (default 'assword:' ;)
    # or providing a password file, slightly more secure
    sshpass -f <file> ssh ...
    ```

## Issues and Alternatives

> [!tip]- For flaky connections or if changing networks in something you regular do, consider [mosh (mobile shell)](https://mosh.org/). 
> >Remote terminal application that allows **roaming**, supports **intermittent connectivity**, and provides intelligent **local echo** and line editing of user keystrokes.
> >
> >Mosh is a replacement for interactive SSH terminals. It's more robust and responsive, especially over Wi-Fi, cellular, and long-distance links.
> >
> >Mosh is free software, available for GNU/Linux, BSD, macOS, Solaris, Android, Chrome, and iOS.


## References

- [CVE-2024-6387]: regression lead to vulnerability
    - [patched Ubuntu packages](https://ubuntu.com/security/notices/USN-6859-1)

[^5]: [RedHat article SSH dynamic Port-Forwarding](https://www.redhat.com/sysadmin/ssh-dynamic-port-forwarding)
[^6]: [RedHat article SSH ProxyJump](https://www.redhat.com/sysadmin/ssh-proxy-bastion-proxyjump)
[^cve-proxy-command]: [CVE-2023-51385](<https://nvd.nist.gov/vuln/detail/CVE-2023-51385>)
[CVE-2024-6387]: <https://nvd.nist.gov/vuln/detail/CVE-2024-6387>
[^config_match]: <https://unix.stackexchange.com/a/528212>
[^1]: <https://www.howtogeek.com/825102/how-to-run-a-local-script-on-a-remote-linux-server/>