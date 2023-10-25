---
title: SSH
tags: tech/SSH
visibility: public
---

## Config

### General
```ssh_config
Host xyz x* WhatEverYouWannaCallIt
  HostName 123.456.78.90
  User Durp
  IdentityFile ~/.ssh/super-secret-key
```
- `Host` can be any identifier, even regular expressions
- `HostName` is the public hostname or IP address of your remote machine
- `User` is the username for this connection
- `IdentityFile` is the SSH private key for this connection

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

### Forwarding
forward private keys, so they can be used on the remote host
	```ssh_config
	Host xyz
		ForwardAgent yes
	```
### Proxy Command
SSH-tunneling through intermediate host
	```
	Host xyz
		ProxyCommand ssh proxy.host nc -w1 %h %p
	```

## Commands
Edit remote files
```bash
program scp://user@server[:port]//path/to/file
# supported protocols depend on program: sftp, rsync, https, ...
```

[Run local script on remote host (DaveMcKay@HowToGeek)](https://www.howtogeek.com/825102/how-to-run-a-local-script-on-a-remote-linux-server/)
  ```bash
  ssh user@host "bash -s" -- < local_script.sh arg1 arg2 ...
```

## SOCKS proxy

Tags: #tech/SSH/SOCKS
[[networking#^d2523a|IANA port]]: 1080

SSH config
```
Host hostname
    User username
    HostName %h.domain.com
    # SOCKS proxy
    # RemoteForward 1080
    DynamicForward 1080 # corresponds to CL option -D
```
then configure browser to use that proxy.

References
- [RedHat article]

[RedHat article]: https://www.redhat.com/sysadmin/ssh-dynamic-port-forwarding
